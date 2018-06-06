output "ip" {
  value = "${aws_instance.sync_instance.public_ip}"
}