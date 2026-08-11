#Adding the subnet Configuration
locals {
  hospital_subnets = {
    clinical-az1 = {
      vpc_key           = "clinical"
      cidr_block        = "10.0.0.0/24"
      availability_zone = "us-east-1a"
      name              = "hospital-clinical-az1-subnet"
    }

    clinical-az2 = {
      vpc_key           = "clinical"
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1b"
      name              = "hospital-clinical-az2-subnet"
    }

    analytics-az1 = {
      vpc_key           = "analytics"
      cidr_block        = "10.1.0.0/24"
      availability_zone = "us-east-1a"
      name              = "hospital-analytics-az1-subnet"
    }

    analytics-az2 = {
      vpc_key           = "analytics"
      cidr_block        = "10.1.1.0/24"
      availability_zone = "us-east-1b"
      name              = "hospital-analytics-az2-subnet"
    }

    admin-az1 = {
      vpc_key           = "admin"
      cidr_block        = "10.2.0.0/24"
      availability_zone = "us-east-1a"
      name              = "hospital-admin-az1-subnet"
    }

    admin-az2 = {
      vpc_key           = "admin"
      cidr_block        = "10.2.1.0/24"
      availability_zone = "us-east-1b"
      name              = "hospital-admin-az2-subnet"
    }
  }
}

resource "aws_subnet" "hospital" {
  for_each = local.hospital_subnets

  vpc_id            = aws_vpc.hospital[each.value.vpc_key].id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.value.name
  }
}