module "coinnode-us-east-1" {
  source = "coin/krb"
  region = "us-east-1"
}


module "coinnode-us-east-2" {
  source = "coin/krb"
  region = "us-east-2"
}

module "coinnode-us-west-1" {
  source = "coin/krb"
  region = "us-west-1"
}