provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_key_pair" "vpn" {
  key_name   = "${var.key}"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_ami_from_instance" "vpn_for_delete" {
  name               = "vpn_for_delete"
  source_instance_id = "i-002c2421ef4f808b5"
  vpc_security_group_ids = "sg-0f9994bc47d170d06"

  provisioner "local-exec" {
    # sed 替换掉ip里的配置文件
    command = "echo ${aws_ami_from_instance.vpn_for_delete.public_ip} > ip_address.txt"
  }
  
  provisioner "file" {
    source      = "conf/shadowsocks.conf"
    destination = "/etc/shadowsocks.conf"
  }

  connection {
    user        = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "remote-exec" {
    # 重启服务
    inline = [
        "sudo service shadowsocks restart",
        "sudo service openvpn restart"
    ]
  }
}