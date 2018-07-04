terraform {
  backend "s3" {
    bucket = "k8s.btcc.shop"
    key = "terraform"
    region = "ap-northeast-1"
  }
}
