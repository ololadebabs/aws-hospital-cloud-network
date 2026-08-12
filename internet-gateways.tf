#Internet gateway that givess access to the internet for public-facing resources
#3 igws will be created and each will be attached to the matching vpc
resource "aws_internet_gateway" "hospital" {
  for_each = var.hospital_vpcs #loops through the vpcs

  vpc_id = aws_vpc.hospital[each.key].id #connects each igw to the correct vpc

  tags = {
    Name = "hospital-${each.key}-igw"
  }
}