## 规范

* `VPC`使用小写的货币全程,分别开放`rpc`, `p2p`, `ssh`
* 秘钥一律使用本地的秘钥，同一命名为`local`
* `aws_instance` 的实例名为币种缩写， 标签名为`coinnode`前缀加币种，例如: `btc` 和 `coinnode-btc`

```
resource "aws_key_pair" "local" {
  key_name   = "local"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
  
}

```
