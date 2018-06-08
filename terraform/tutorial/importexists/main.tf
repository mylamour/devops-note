resource "aws_instance" "ffff" {

    provisioner "local-exec" {
        command = "echo first"
    }

}