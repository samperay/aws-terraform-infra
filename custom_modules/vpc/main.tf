resource "aws_vpc" "test" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc-test"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = var.public_subnet_az1
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true


  tags = {
    Name = "public-subnet-test"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.test.id

  tags = {
    Name = "internet-gw-test"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table-test"
  }
}

resource "aws_route_table_association" "public_subnet_az1" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}
