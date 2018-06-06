variable "namespace" {
  default = "global"
}

variable "stage" {
  default = "default"
}

variable "name" {
  default = "test_efs"
}

variable "region" {
    default = "ap-southeast-2"
}

variable "vpc_id" {}

// variable "aws_region" {}


// variable "availability_zones" {
//   type = "list"
// }

variable "zone_id" {}

// variable "delimiter" {
//   type    = "string"
//   default = "-"
// }

// variable "attributes" {
//   type    = "list"
//   default = []
// }

// variable "tags" {
//   type    = "map"
//   default = {}
// }