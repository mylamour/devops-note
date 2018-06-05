terraform {
  required_version = ">= 0.10.3"
}

provider "aws" {
  region = "${var.region}"
}

// 该方式不适合多区域部署，因为其他区域并没有这个实例
// resource "aws_ami_from_instance" "bch" {
//   name               = "coinnode-bch"
//   source_instance_id = "i-0207248c84462ce29"
//   // instance_type      = "t2.micro"

// }

data "aws_ami" "default" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu-xenial-16.04*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  owners = ["amazon"]
}

resource "aws_key_pair" "local" {
  key_name   = "local"
  public_key = "${aws_key_pair.local.key_name}"
}