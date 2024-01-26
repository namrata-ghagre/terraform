resource "aws_vpc" "my_vpc" {
  cidr_block           = var.my_vpc_cidr
  enable_dns_support   = var.vpc_support
  enable_dns_hostnames = var.vpc_hostname
  tags                 = var.vpc_tags
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = var.vpc_igw_tags
}

resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.vpc_cidr_az_1
  availability_zone       = var.vpc_az_1
  map_public_ip_on_launch = true

  tags = var.vpc_pub_tags
}


resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.vpc_pub_cidr_2
  availability_zone       = var.vpc_az_2
  map_public_ip_on_launch = true

  tags = var.vpc_pub_2_tags
}


resource "aws_subnet" "private_subnet_az1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.vpc_pri_cidr
  availability_zone = var.vpc_az_1

  tags = var.vpc_pri_tags
}


resource "aws_subnet" "private_subnet_az2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.vpc_pri_cidr_az2
  availability_zone = var.vpc_az_2

  tags = var.vpc_pri2_tags
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.vpc_routetable
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = var.vpc_routetable_tags
}


resource "aws_route_table_association" "public_subnet_association_az1" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_association_az2" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
  }

  tags = var.vpc_sg_tags

}
