resource "aws_route_table" "public" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygw.id
  }

  route {
   cidr_block        = aws_vpc.myvpc.cidr_block
   egress_only_gateway_id = "local"
  }

  tags = {
    Name = "public"
  }
}

#private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.myvpc.id

  route {
     cidr_block  = aws_vpc.myvpc.cidr_block
    egress_only_gateway_id = "local"
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}