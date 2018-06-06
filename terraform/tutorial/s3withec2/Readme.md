# 策略

node实例拥有自己IAM, 然后把s3授权给特定的IAM访问，由此达到同步的目的。
并且不需要通过key/pari进行访问s3, 策略的生成可以使用[policygen](https://awspolicygen.s3.amazonaws.com/policygen.html)

# Todo

- [ ] 创建IAM子账号
- [ ] timeout
- [ ] 检查是否存在某个资源或者策略，然后判断是否接着部署
- [ ] 配置S3策略
- [ ] 启动特定IAM的实例
- [ ] 前后依赖的顺序关系
- [ ] 编写同步脚本并由该实例执行，脚本应该是命令行配置的，例如`./sync.sh btc`, `./sync.sh dash`
