terraform {
  required_version = ">= 0.10.3"
}

provider "aws" {
  region = "${var.region}"
}

resource "aws_ami_from_instance" "bch" {
  name               = "coinnode-bch"
  source_instance_id = "i-0207248c84462ce29"
  // instance_type      = "t2.micro"

}

resource "aws_key_pair" "local" {
  key_name   = "local"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDyHfIBLpGWzmOi35aSn7mjib+LN1GHKraWlas6aNW7lqB1QC0H2SnyDX3t9gPBbQ4ilnZWUf2/NK9DbxsnmQYb/XBEP0S5NfpALVYLgTudi5cBoQP8b9Z1/O9yUuIu0MTgETYYBrRT5mHVk0yMWiQ625RCjEQ1hDhVYQS5yO4k4T0yQYjZeGZmXZGL2J84+H5Hj+Og3cfWh3ndpqz93n7EAWHnIjNOKoyof8l59McKq36+K2cAJwE1r/ObZzM/vAT01q89Cqm4gMD+sB2/+GhqRmOaD/NmUYkBlQ6Sn8Cz0y6c1s6McUVZwUpIbbYKBgM6RVL/pT6w90lzfThX783 mour@lime.local"
}