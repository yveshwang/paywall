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

## Usage

`terraform.tfvars` holds variables which should be overriden with valid ones. Be sure to push it when its updated.

### Plan

```
terraform plan -var-file terraform.tfvars
```

### Apply

```
terraform apply -var-file terraform.tfvars
```

### Destroy

```
terraform destroy -var-file terraform.tfvars
```

### Authors
Yves Hwang
03.10.2018
