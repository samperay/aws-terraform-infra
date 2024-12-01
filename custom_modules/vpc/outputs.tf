output "vpc_id" {
    value = aws_vpc.main
}

output "aws_subnet_id" {
    value = aws_subnet.public_subnet_az1.id
  
}

output "igw_id" {
    value = aws_internet_gateway.gw.id
  
}

output "route_table_id" {
  
  value = aws_route_table.public_route_table.id
}