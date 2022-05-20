resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  tags = {
    Name = "myvpc"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr
  tags = { Name = "Public Subnet"
  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  tags = {
    Name = "Private Subnet"
  }
}