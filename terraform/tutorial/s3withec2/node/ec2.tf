provider "aws" {
    region = "${var.region}"
}

resource "aws_key_pair" "local" {
  key_name   = "local"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "datasync" {
  ami                = "ami-b374d5a5"
  instance_type      = "t2.micro"
  key_name = "${aws_key_pair.local.key_name}"
  depends_on = ["aws_s3_bucket.btcc_coinnode_sync"]
  
  tags {
    Name = "datasyncs3demo"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.datasync.public_ip} >> ip_address.txt"
  }
  
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "sync.sh"
    destination = "/tmp/sync.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo bash /tmp/sync.sh" ,
      "sleep 1",
    ]
  }
}