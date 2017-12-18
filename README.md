# paywall

This repo started off containing the terraform stuff to setup for evaluating Fastly paywall, however it has moved on as the home for the AWS Cloudfront based paywall. Unfortunately this is a demo setup, so no time is spent on doing a shared state and relying on `git` for now.

The edge side token is written in to `lambda@edge` in [token-verification-lambda-edge][https://github.com/yveshwang/token-verification-lambda-edge/] module. Check out the [readme][https://github.com/yveshwang/token-verification-lambda-edge] there for more info. It is written in `node.js`.

Make sure you got the private key called `test_id_rsa_internal.pem` handy. Easiest is have `ssh-agent` running and add the key to it. The key here resides in our vault. Note also this demo is pointing to London `eu-west-2` region. Note that the Lambda@Edge must be in `us-east-1` at the time of writing.

Note that replicated lambda on edge cannot be deleted. This is a huge pain in the ass. In addition, there are some issues with `terraform` when it comes to Lambdas. When getting stuck, trying rerunning `terraform apply` and at times, use some `terraform taint`.

Note with lambda, often you have to perform this double `terraform apply` with the first updating the lambda hash, upload the zip file and publish a new version. Whilst the second apply will change the configuration on CF.

Another thing to note is that CF is very slow. Currently there are no mock implementation of CF to verify the request/response structure and content to and from the origin.

## Getting started - lambda@edge
Get the plugin first if you haven't already. Be sure you have some kind of `node.js v6.10.3` env ready.

Get submodule(s) first. And if it your first time, do

```
git submodule init
```

then grab the lambda.zip file...

```
git submodule update --recursive --remote
cd token-verification-lambda-edge/
npm run-script dist
cd ..
cp token-verification-lambda-edge/lambda.zip .
```

## Getting started - infra with terraform
Build paywall infra
```
terraform get
```

Then for the `ansible` part, obtain the public IP via `terraform show` and update the `hosts` file locally in the directory.

Then ensure `ssh-agent` is running and key added.

```
ssh-agent -l
ssh-add ~/.ssh/test_id_rsa_internal.pem
```

Note that the initial ec2 would not have `python` installed, and thus some of the `ansible` modules will fail. If this is the case, run the playbook.

```
ansible-playbook -i hosts provision.yml
```

Pull down any git submodule

```
git submodule update
```

## Terraform usage
To plan
```
terraform plan
```

To apply
```
terraform apply
```

To destroy
```
terraform destroy
```
## Cloudfront setup: AWS WAF
There is a git submodule that sits within this repo that contains the AWS WAF, current this is a big pain in the bum to setup and it involves essentially pushing the `YAML` files as into `s3`, then provisioning it via the `aws cloudformation` tool by pointing it to S3. The tricky part here is that the built in bucket name can come into conflict with the script itself; not to mention that it takes ages to provision this.

See https://github.com/awslabs/aws-waf-security-automations/issues/3

Steps to get this to work is to instead use `aws console`, and then connect the WAF by hand to the `cloud formation` setup. See http://docs.aws.amazon.com/solutions/latest/aws-waf-security-automations/template.html and for a clickable version, http://docs.aws.amazon.com/solutions/latest/aws-waf-security-automations/deployment.html

## Cloudfront limits
Be aware of the limits, such as number of WAF rules and conditions. See
http://docs.aws.amazon.com/waf/latest/developerguide/limits.html

## OWASP
Since this is for the paywall, examples of how top 10 OWASP is mitigated.

  * SQLInjection - mitigated by WAF DONE
  * Hijacked token - mitigated by using client.ip or geo location at least for the issued tokens as part of aud or sub or some other attributes. Can also support unique string of course. DONE
  * Cross site scripting - mitigated by WAF DONE
  * Path traversal, LFI, RFI - mitigated by WAF NOT APPLICABLE
  * Privileged module access, say /admin should only come form office network - mitigated by WAF, needs explicit setup in WAF NOT APPLICABLE
  * PHP specifics security config - NA NOT APPLICABLE
  * Abnormal request via size restriction and sanitisation - mitigated by WAF IN PROGRESS
  * CSRF token presence - not enforced. we use jsonwebtoken. we could do this for circlekid when it is plugged into the paywall. NOT APPLICABLE
 * Serverside includes - request pattern for web root that should not be directly accessible - NA NOT APPLICABLE
 * IP blacklist - we could populate a "reputation based" list, skip for now - NA NOT APPLICABLE

## Fastly setup @deprecated
Some manual (for now?) steps are required to setup Fastly.

  1. log into your Fastly account
  2. create a new DNS entry in Fastly, for example `fastly.test.gneis.io`
  3. grab the `r53` record entry, `paywall.test.gneis.io` and set that as the `host` to the aforementioned Fastly entry.
  4. Update our own CNAME record in `r53` to point `fastly.test.gneis.io` to say `nonssl.global.fastly.net`, since we are not dealing with any TLS backends here.

## Authors
Yves Hwang
18.12.2018
