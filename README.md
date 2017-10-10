# paywall-fastly

This repo contains the terraform stuff to setup for evaluating Fastly paywall setup. Unfortunately this is a demo setup, so no time is spent on doing a shared state and relying on `git` for now.

Make sure you got the private key called `test_id_rsa_internal.pem` handy. Easiest is have `ssh-agent` running and add the key to it. The key here resides in our vault. Note also this demo is pointing to London `eu-west-2` region.

## Getting started
Get the plugin first if you haven't already.

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

## Fastly setup
Some manual (for now?) steps are required to setup Fastly.

1. log into your Fastly account
2. create a new DNS entry in Fastly, for example `fastly.test.gneis.io`
3. grab the `r53` record entry, `paywall.test.gneis.io` and set that as the `host` to the aforementioned Fastly entry.
4. Update our own CNAME record in `r53` to point `fastly.test.gneis.io` to say `nonssl.global.fastly.net`, since we are not dealing with any TLS backends here.

## Authors
Yves Hwang
03.10.2018
