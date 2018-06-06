resource "aws_s3_bucket" "btcc_coinnode_sync" {
    bucket = "${var.bucket_name}"
    acl = "private"             
    //"public-read"

    tags {
        Name        = "CoinBlock"
    }

    versioning {
        enabled = true
    }

    // lifecycle {
    //     prevent_destroy = true
    // }
}