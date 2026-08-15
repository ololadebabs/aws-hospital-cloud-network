#create two additional /28 TGW subnets per VPC, one in each Availability Zone, for six total.
locals {
  hospital_tgw_subnets = {
    clinical-tgw-az1 = {
      vpc_key           = "clinical"
      cidr_block        = "10.0.2.0/28"
      availability_zone = "us-east-1a"
      name              = "hospital-clinical-tgw-az1-subnet"
    }

    clinical-tgw-az2 = {
      vpc_key           = "clinical"
      cidr_block        = "10.0.3.0/28"
      availability_zone = "us-east-1b"
      name              = "hospital-clinical-tgw-az2-subnet"
    }

    analytics-tgw-az1 = {
      vpc_key           = "analytics"
      cidr_block        = "10.1.2.0/28"
      availability_zone = "us-east-1a"
      name              = "hospital-analytics-tgw-az1-subnet"
    }

    analytics-tgw-az2 = {
      vpc_key           = "analytics"
      cidr_block        = "10.1.3.0/28"
      availability_zone = "us-east-1b"
      name              = "hospital-analytics-tgw-az2-subnet"
    }

    admin-tgw-az1 = {
      vpc_key           = "admin"
      cidr_block        = "10.2.2.0/28"
      availability_zone = "us-east-1a"
      name              = "hospital-admin-tgw-az1-subnet"
    }

    admin-tgw-az2 = {
      vpc_key           = "admin"
      cidr_block        = "10.2.3.0/28"
      availability_zone = "us-east-1b"
      name              = "hospital-admin-tgw-az2-subnet"
    }
  }
}

resource "aws_subnet" "hospital_tgw" {
  for_each = local.hospital_tgw_subnets

  vpc_id            = aws_vpc.hospital[each.value.vpc_key].id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.value.name
  }
}

