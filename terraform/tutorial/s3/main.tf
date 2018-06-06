terraform {
  required_version = ">= 0.10.3"
}

provider "aws" {
    region = "${var.region}"
}

resource "aws_s3_bucket" "btcc_terraform_test" {
    bucket = "${var.bucket_name}"
    acl = "private"             
    //"public-read"

    tags {
        Name        = "Terraform S3"
    }

    versioning {
        enabled = true
    }

    lifecycle {
        prevent_destroy = true
    }
}