terraform {
  required_version = ">= 0.10.3"
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_role" "sync" {
  name               = "sync-role"
  assume_role_policy = "${file("assume-role-policy.json")}"
}

resource "aws_iam_policy" "sync_policy" {
  name        = "sync-policy"
  description = "A sync policy"
  policy      = "${file("assume-s3-policy.json")}"
}

resource "aws_iam_policy_attachment" "sync_attach" {
  name       = "sync-attachment"
  roles      = ["${aws_iam_role.sync.name}"]
  policy_arn = "${aws_iam_policy.sync_policy.arn}"
}

resource "aws_iam_instance_profile" "sync_profile" {
  name  = "sync-profile"
  role = "${aws_iam_role.sync.name}"
}

resource "aws_key_pair" "local" {
  key_name   = "local"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "sync_instance" {
  ami                    = "ami-9a562df2"
  instance_type          = "t2.micro"
  iam_instance_profile   = "${aws_iam_instance_profile.sync_profile.name}"
  vpc_security_group_ids = ["${aws_security_group.ssh.id}"]
  key_name = "${aws_key_pair.local.key_name}"

  tags {
    Name     = "Sync Instance Demo" 
  }

  
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "s3synccheck.sh"
    destination = "/tmp/s3synccheck.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo bash /tmp/s3synccheck.sh"
    ]
  }
}