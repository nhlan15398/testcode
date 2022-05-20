resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "Internet Gateway"
  }
}
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "Route Table"
  }
}
resource "aws_route" "public_subnet_internet_gateway_ipv4" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
resource "aws_route_table_association" "associate_public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}