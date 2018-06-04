terraform {
  required_version = ">= 0.10.3"
}

provider "aws" {
  region = "${var.region}"
}

resource "aws_ami_from_instance" "bch" {
  name               = "coinnode-bch"
  source_instance_id = "i-0207248c84462ce29"
}