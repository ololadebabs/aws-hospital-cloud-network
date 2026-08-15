#Creates Clinical <-> Analytics Peering 
/*
resource "aws_vpc_peering_connection" "clinical_analytics" {
  vpc_id      = aws_vpc.hospital["clinical"].id  #requester vpc
  peer_vpc_id = aws_vpc.hospital["analytics"].id #accepter vpc
  auto_accept = true

  tags = {
    Name = "hospital-clinical-analytics-peering"
  }
}

#Creates Clinical <-> Admin Peering
resource "aws_vpc_peering_connection" "clinical_admin" {
  vpc_id      = aws_vpc.hospital["clinical"].id #requester vpc
  peer_vpc_id = aws_vpc.hospital["admin"].id    #accepter vpc
  auto_accept = true

  tags = {
    Name = "hospital-clinical-admin-peering"
  }
}
*/

#creating peering connections alone is not enough, we still need to tell the route tables to send traffic through them