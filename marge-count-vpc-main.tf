resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenancy


  tags = merge(var.common_tag, { Name = "${var.namespace}Vpc" })
}


resource "aws_subnet" "main1" {
  count                   = length(var.public_subnet)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnet, count.index)
  map_public_ip_on_launch = true

  tags = merge(var.common_tag, { Name = "${var.namespace}-Pub-subnet-${count.index + 1}" })
}

resource "aws_subnet" "main2" {
  count      = length(var.public_subnet)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.private_subnet, count.index)


  tags = merge(var.common_tag, { Name = "${var.namespace}-Pri-subnet-${count.index + 1}" })
}
