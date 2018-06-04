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
    values = ["amzn-ami-hvm-2016.09*"]
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

resource "aws_instance" "karbo" {
  ami                = "${data.aws_ami.default.id}"
  instance_type      = "t2.micro"
  tags {
    Name = "coinnode-karbo"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.karbo.public_ip} >> ip_address.txt"
  }

  provisioner "file" {
    source      = "scripts/install_karbo.sh"
    destination = "/tmp/install_karbo.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo bash /tmp/install_karbo.sh"
    ]
  }
  timeout {
    
  }
}

resource "aws_key_pair" "local" {
  key_name   = "local"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDyHfIBLpGWzmOi35aSn7mjib+LN1GHKraWlas6aNW7lqB1QC0H2SnyDX3t9gPBbQ4ilnZWUf2/NK9DbxsnmQYb/XBEP0S5NfpALVYLgTudi5cBoQP8b9Z1/O9yUuIu0MTgETYYBrRT5mHVk0yMWiQ625RCjEQ1hDhVYQS5yO4k4T0yQYjZeGZmXZGL2J84+H5Hj+Og3cfWh3ndpqz93n7EAWHnIjNOKoyof8l59McKq36+K2cAJwE1r/ObZzM/vAT01q89Cqm4gMD+sB2/+GhqRmOaD/NmUYkBlQ6Sn8Cz0y6c1s6McUVZwUpIbbYKBgM6RVL/pT6w90lzfThX783 mour@lime.local"
}