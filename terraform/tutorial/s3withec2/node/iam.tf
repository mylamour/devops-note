
resource "aws_iam_policy" "syncpolicy" {
  name        = "sync_policy"
  path        = "/"
  description = "Sync From My S3 Bucket"

  policy = <<EOF
  {
      "Version": "2012-10-17",
      "Statement": [{
              "Effect": "Allow",
              "Action": [
                  "s3:ListBucket"
              ],
              "Resource": [
                  "arn:aws:s3:::btcccoinblocknode"
              ]
          },
          {
              "Effect": "Allow",
              "Action": [
                  "s3:PutObject",
                  "s3:GetObject",
                  "s3:ListObject"
              ],
              "Resource": [
                  "arn:aws:s3:::btcccoinblocknode/*"
              ]
          }
      ]
  }
EOF
}