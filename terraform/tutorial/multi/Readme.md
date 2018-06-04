启动一个以配置为`bch`的机器

`terraform apply -input=false`

`terraform init -var "source=coin/bch"`


导入aws key

` terraform import aws_key_pair.deployer deployer-key `

有时候不同的区域内可能有不同的镜像，所以要通过过滤的形式然后去构建