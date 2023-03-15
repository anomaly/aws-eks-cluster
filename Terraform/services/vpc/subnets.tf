# Subnets
#
# Description:
# A subnet is a range of IP addresses in your VPC.
#
# AWS Documentation:
# https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html
#
# Terraform Documentation:
# @TODO

resource "aws_subnet" "public_a" {
    vpc_id = aws_vpc.default.id
    availability_zone = "ap-southeast-2a"
    cidr_block = "192.168.0.0/18"
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.tags.Name} public zone A"
        "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "public_b" {
    vpc_id = aws_vpc.default.id
    availability_zone = "ap-southeast-2b"
    cidr_block = "192.168.64.0/18"
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.tags.Name} public zone B"
        "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "private_a" {
    vpc_id = aws_vpc.default.id
    availability_zone = "ap-southeast-2a"
    cidr_block = "192.168.128.0/18"
    tags = {
        Name = "${var.tags.Name} private zone A"
    }
}

resource "aws_subnet" "private_b" {
    vpc_id = aws_vpc.default.id
    availability_zone = "ap-southeast-2b"
    cidr_block = "192.168.192.0/18"
    tags = {
        Name = "${var.tags.Name} private zone B"
    }
}
