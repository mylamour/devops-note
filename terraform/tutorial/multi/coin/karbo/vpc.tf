resource "aws_security_group" "karbo" {
    name = "karbo"
    description = "Karbo Coin Vpc Rules"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "ssh"
        cidr_blocks = ["0.0.0.0/0"]
    }
    // ingress {
    //     from_port = 80
    //     to_port = 80
    //     protocol = "tcp"
    //     cidr_blocks = ["0.0.0.0/0"]
    // }
    // ingress {
    //     from_port = 443
    //     to_port = 443
    //     protocol = "tcp"
    //     cidr_blocks = ["0.0.0.0/0"]
    // }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = -1
        to_port = -1
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    // egress { # SQL Server
    //     from_port = 1433
    //     to_port = 1433
    //     protocol = "tcp"
    //     cidr_blocks = ["${var.private_subnet_cidr}"]
    // }
    // egress { # MySQL
    //     from_port = 3306
    //     to_port = 3306
    //     protocol = "tcp"
    //     cidr_blocks = ["${var.private_subnet_cidr}"]
    // }

    // vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Karbo"
    }
}