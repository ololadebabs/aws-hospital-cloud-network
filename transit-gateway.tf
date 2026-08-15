#TGW is created with DNS support and the default association/propagation settings enabled.
resource "aws_ec2_transit_gateway" "hospital" {
  description = "Hospital Transit Gateway"

  dns_support                     = "enable"
  vpn_ecmp_support                = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"

  tags = {
    Name = "hospital-transit-gateway"
  }
}

#Create 3 VPC attachments
#Manages a VPC attachment and requires subnet IDs, a Transit Gateway ID, and VPC ID
resource "aws_ec2_transit_gateway_vpc_attachment" "clinical" {
  subnet_ids = [
    aws_subnet.hospital_tgw["clinical-tgw-az1"].id,
    aws_subnet.hospital_tgw["clinical-tgw-az2"].id
  ]

  transit_gateway_id = aws_ec2_transit_gateway.hospital.id
  vpc_id             = aws_vpc.hospital["clinical"].id

  tags = {
    Name = "hospital-clinical-tgw-attachment"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "analytics" {
  subnet_ids = [
    aws_subnet.hospital_tgw["analytics-tgw-az1"].id,
    aws_subnet.hospital_tgw["analytics-tgw-az2"].id
  ]

  transit_gateway_id = aws_ec2_transit_gateway.hospital.id
  vpc_id             = aws_vpc.hospital["analytics"].id

  tags = {
    Name = "hospital-analytics-tgw-attachment"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "admin" {
  subnet_ids = [
    aws_subnet.hospital_tgw["admin-tgw-az1"].id,
    aws_subnet.hospital_tgw["admin-tgw-az2"].id
  ]

  transit_gateway_id = aws_ec2_transit_gateway.hospital.id
  vpc_id             = aws_vpc.hospital["admin"].id

  tags = {
    Name = "hospital-admin-tgw-attachment"
  }
}