#Create security groups. Warn against using 0.0.0.0/0 unnecessarily
resource "aws_security_group" "hospital_ec2" {
  for_each = var.hospital_vpcs

  name        = "hospital-${each.key}-ec2-sg"
  description = "Allow ICMP traffic between hospital network environments"
  vpc_id      = aws_vpc.hospital[each.key].id

  ingress {
    description = "Allow ICMP from hospital private network range"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "hospital-${each.key}-ec2-sg"
  }
}