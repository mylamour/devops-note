# 使用指南

* 无需交互的启动机器
`terraform apply -input=false`

* 从命令行启动一个以配置为`bch`的机器
`terraform init -var "source=coin/bch"`

* 从配置文件启动一个以某某为配置的机器
`terraform init -var-file terraform.tfvars`

* 导入aws key
` terraform import aws_key_pair.local local `

# ToDo 

- [ ] 更新远程状态，推送脚本
- [ ] 自动扩展机器性能
- [x] 多区域部署机器
- [ ] EFS的跨区配置

# Other

* 导出现有的aws配置
`terraforming s3 `

* 有时候不同的区域内可能有不同的镜像，所以要通过过滤的形式然后去构建