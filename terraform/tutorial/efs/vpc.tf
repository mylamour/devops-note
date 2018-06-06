resource "aws_security_group" "ec2" {
  name        = "${var.name}-ec2"
  description = "Allow traffic out to NFS for ${var.name}-mnt."
  // vpc_id      = "${var.vpc_id}"

  tags {
    Name = "allow_nfs_out_to_${var.name}-mnt"
    terraform = "true"
  }
}

resource "aws_security_group" "mnt" {
  name        = "${var.name}-mnt"
  description = "Allow traffic from instances using ${var.name}-ec2."
  // vpc_id      = "${var.vpc_id}"

  tags {
    Name = "allow_nfs_in_from_${var.name}-ec2"
    terraform = "true"
  }
}

resource "aws_security_group_rule" "nfs-in" {
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  security_group_id = "${aws_security_group.mnt.id}"
  source_security_group_id = "${aws_security_group.ec2.id}"
}

resource "aws_security_group_rule" "nfs-out" {
  type                     = "egress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  security_group_id = "${aws_security_group.ec2.id}"
  source_security_group_id = "${aws_security_group.mnt.id}"
}

resource "aws_security_group_rule" "ssh" {
  security_group_id = "${aws_security_group.ec2.id}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]
}

// resource "aws_security_group_rule" "egress" {
//   security_group_id = "${aws_security_group.ec2.id}"
//   type              = "egress"
//   protocol          = "-1"
//   from_port         = 0
//   to_port           = 0
//   cidr_blocks       = ["0.0.0.0/0"]
// }

resource "aws_default_subnet" "subnets" {
  availability_zone = "${var.region}"

    tags {
        Name = "Default subnet for us-west-2a"
    }
}