#Managing existing route table and creating internet route
resource "aws_default_route_table" "hospital" {
  for_each = var.hospital_vpcs

  default_route_table_id = aws_vpc.hospital[each.key].default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hospital[each.key].id
  }

  tags = {
    Name = "hospital-${each.key}-route-table"
  }
}