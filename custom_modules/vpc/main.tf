
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = "main"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_az1
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true


  tags = {
    Name = "public_subnet_az1"
  }
}

# resource "aws_subnet" "public_subnet_az2" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.public_subnet_az2
#   availability_zone = data.aws_availability_zones.available.names[1]
#   map_public_ip_on_launch = true


#   tags = {
#     Name = "public_subnet_az2"
#   }
# }

# resource "aws_subnet" "private_subnet_az1" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.private_subnet_az1
#   availability_zone = data.aws_availability_zones.available.names[0]


#   tags = {
#     Name = "private_subnet_az1"
#   }
# }


# resource "aws_subnet" "private_subnet_az2" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.private_subnet_az2
#   availability_zone = data.aws_availability_zones.available.names[1]


#   tags = {
#     Name = "private_subnet_az2"
#   }
# }

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public Route table"
  }
}

resource "aws_route_table_association" "public_subnet_az1" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}