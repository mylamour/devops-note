terraform {
  required_version = ">= 0.10.3"
}

provider "aws" {
  region = "${var.region}"
}

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

resource "aws_instance" "btc" {
  ami                = "${data.aws_ami.default.id}"
  instance_type      = "t2.micro"
  tags {
    Name = "coinnode-btc"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.btc.public_ip} >> ip_address.txt"
  }

  provisioner "file" {
    source      = "scripts/install_btc.sh"
    destination = "/tmp/install_btc.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo bash /tmp/btc.sh"
    ]
  }
}

resource "aws_key_pair" "local" {
  key_name   = "local"
  public_key = "${aws_key_pair.local.key_name}"
}