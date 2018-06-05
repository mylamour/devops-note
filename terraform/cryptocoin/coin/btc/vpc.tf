resource "aws_security_group" "bitcoin" {
    name = "bitcoin"
    description = "BTC Coin VPC Rules"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress { //rpc
        from_port = 8332
        to_port = 8332
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress { //p2p
        from_port = 8333
        to_port = 8333
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "BTC"
    }
}