#Managing existing route table and creating internet route
resource "aws_default_route_table" "hospital" {
  for_each = var.hospital_vpcs

  default_route_table_id = aws_vpc.hospital[each.key].default_route_table_id

  tags = {
    Name = "hospital-${each.key}-route-table"
  }
}

#Internet routes
resource "aws_route" "internet" {
  for_each = var.hospital_vpcs

  route_table_id         = aws_vpc.hospital[each.key].default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.hospital[each.key].id
}

#peering route tables
resource "aws_route" "clinical_to_analytics" {
  route_table_id            = aws_vpc.hospital["clinical"].default_route_table_id
  destination_cidr_block    = "10.1.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.clinical_analytics.id
}

resource "aws_route" "analytics_to_clinical" {
  route_table_id            = aws_vpc.hospital["analytics"].default_route_table_id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.clinical_analytics.id
}

resource "aws_route" "clinical_to_admin" {
  route_table_id            = aws_vpc.hospital["clinical"].default_route_table_id
  destination_cidr_block    = "10.2.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.clinical_admin.id
}

resource "aws_route" "admin_to_clinical" {
  route_table_id            = aws_vpc.hospital["admin"].default_route_table_id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.clinical_admin.id
}

