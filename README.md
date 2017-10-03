# paywall-fastly

This repo contains the terraform stuff to setup for evaluating Fastly paywall setup. Unfortunately this is a demo setup, so no time is spent on doing a shared state and relying on `git` for now.

Make sure you got the private key called `test_id_rsa_internal.pem` handy. This resides in our vault. Note also the demo is pointing to London `eu-west-2` region.

## Getting started
Get the plugin first if you haven't already.

```
terraform get
```

## Usage

`terraform.tfvars` holds variables which should be overriden with valid ones.

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
