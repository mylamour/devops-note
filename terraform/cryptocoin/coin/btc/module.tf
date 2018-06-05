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

resource "aws_key_pair" "local" {
  key_name   = "local"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

// Bitcoin Node At leaset have 2G RAM
resource "aws_instance" "btc" {
  ami                = "${data.aws_ami.default.id}"
  instance_type      = "t2.small"
  vpc_security_group_ids = ["${aws_security_group.bitcoin.id}"]  
  key_name = "${aws_key_pair.local.key_name}"
  
  tags {
    Name = "coinnode-btc"
  }

  ebs_block_device {
      device_name           = "/dev/sdb"
      // snapshot_id           = ""
      volume_type           = "gp2"
      volume_size           = 100
      delete_on_termination = true
  }

  root_block_device {
      volume_type           = "gp2"
      volume_size           = 30
      delete_on_termination = true
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.btc.public_ip} >> ip_address.txt"
  }
  
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "scripts/btc/install_btc.sh"
    destination = "/tmp/install_btc.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo bash /tmp/install_btc.sh"
    ]
  }
}