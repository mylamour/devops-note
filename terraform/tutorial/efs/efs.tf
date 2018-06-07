resource "random_id" "creation_token" {
  byte_length   = 8
  prefix        = "${var.name}"
}

resource "aws_efs_file_system" "efs" {
  creation_token = "${random_id.creation_token.hex}"

  tags {
    Name = "${var.name}"
    CreationToken = "${random_id.creation_token.hex}"
    terraform = "true"
  }
}

resource "aws_efs_mount_target" "efs" {
  count = "${length(split(",", var.subnets))}"

  file_system_id = "${aws_efs_file_system.efs.id}"
  subnet_id      = "${element(split(",", ${aws_default_subnet.subnets}, count.index)}"
  security_groups = ["${aws_security_group.mnt.id}"]
}
