locals {
  common_tags = {
    project = "jenkins"
  }
}

resource "aws_vpc" "jenkins-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = merge(local.common_tags, {
    Name = "jenkins-vpc"
  })
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.jenkins-vpc.id
  cidr_block = "10.0.0.0/24"
  tags = merge(local.common_tags, {
    Name = "public-subnet"
  })
}

resource "aws_internet_gateway" "jenkins-igw" {
  vpc_id = aws_vpc.jenkins-vpc.id

  tags = merge(local.common_tags, {
    Name = "jenkins-igw"
  })
}

resource "aws_route_table" "jenkins-rtb" {
  vpc_id = aws_vpc.jenkins-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins-igw.id
  }

  tags = merge(local.common_tags, {
    Name = "jenkins-rtb"
  })
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.jenkins-rtb.id
}