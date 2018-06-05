terraform {
  required_version = ">= 0.10.3"
}

provider "aws" {
  region = "${var.region}"
}

// 设置安全组


// 选择AMI

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

// 设置秘钥对
resource "aws_key_pair" "local" {
  key_name   = "local"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

// 设置实例
resource "aws_instance" "karbo" {
  ami                = "${data.aws_ami.default.id}"
  instance_type      = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.karbo.id}"]
  key_name = "${aws_key_pair.local.key_name}"
  
  tags {
    Name = "coinnode-karbo"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.karbo.public_ip} >> ip_address.txt"
  }
  
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "scripts/krb/install_krb.sh"
    destination = "/tmp/install_krb.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo bash /tmp/install_krb.sh" ,
      "nohup karbowanecd &>/dev/null &" ,
      "sleep 1",
    ]
  }
}