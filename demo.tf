# yh
# 03.10.2018

provider "aws" {
  shared_credentials_file = "~/.aws/config"
  region     = "eu-west-2"
}

resource "aws_vpc" "paywall-vpc" {
  enable_dns_hostnames = true
  cidr_block       = "172.32.0.0/16"
  tags {
    Name = "paywall-vpc"
  }
}

resource "aws_internet_gateway" "paywallgw" {
  vpc_id = "${aws_vpc.paywall-vpc.id}"
  tags {
    Name = "paywall-interwebs"
  }
}

resource "aws_subnet" "paywall-subnet" {
  vpc_id = "${aws_vpc.paywall-vpc.id}"
  cidr_block       = "172.32.0.0/20"
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id = "${aws_vpc.paywall-vpc.id}"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_route_table" "paywall-routetable" {
    vpc_id = "${aws_vpc.paywall-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.paywallgw.id}"
    }
    tags {
        Name = "Public Subnet"
    }
}

resource "aws_route_table_association" "paywall-rt-assoc" {
    subnet_id = "${aws_subnet.paywall-subnet.id}"
    route_table_id = "${aws_route_table.paywall-routetable.id}"
}

resource "aws_instance" "demo" {
  ami           = "ami-996372fd"
  associate_public_ip_address = "true"
  instance_type = "t2.micro"
  key_name = "test_id_rsa_internal"
  vpc_security_group_ids = [ "${aws_security_group.allow_all.id}"]
  subnet_id = "${aws_subnet.paywall-subnet.id}"
  depends_on = ["aws_internet_gateway.paywallgw"]
}

resource "aws_route53_record" "paywall-www" {
  zone_id = "ZQVDZWEFRYX0Q"
  name    = "paywall"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.demo.public_ip}"]
}

output "origin_pub_ip" {
  value = "${aws_instance.demo.public_ip}"
}
output "origin_pub_aws_dns" {
  value = "${aws_instance.demo.public_dns}"
}
output "origin_pub_dns" {
  value = "${aws_route53_record.paywall-www.fqdn}"
}
