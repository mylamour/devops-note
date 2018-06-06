# 策略

node实例拥有自己IAM, 然后把s3授权给特定的IAM访问，由此达到同步的目的。
并且不需要通过key/pari进行访问s3, 策略的生成可以使用[policygen](https://awspolicygen.s3.amazonaws.com/policygen.html)

# Todo

