#Create the VPCs that will be representation of segmented business functions
#An AWS VPC is a logically isolated virtual network in which we will later deploy subnets, applications, databases, and other AWS resources
#This single block will create:
#hospital-clinial systems-vpc
#hospital-healthcare analytics-vpc
#hospital-administrative services-vpc

resource "aws_vpc" "hospital" {
  for_each = var.hospital_vpcs

  cidr_block           = each.value.cidr_block
  enable_dns_support   = true #enables AWS DNS inside VPC so instances can resolve names like ec2-54-210-xx.amazonaws.com OR communicate easily with many AWS-managed services
  enable_dns_hostnames = true #allows EC2 instances to receive DNS hostnames

  tags = {
    Name        = "hospital-${each.key}-vpc"
    Environment = each.value.environment
    Purpose     = each.value.purpose
  }
}

