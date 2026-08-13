#This block defines Terraform outputs. Outputs are values that Terraform displays after it finishes creating or updating your infrastructure.
#After deployment, Terraform will display the IDs and CIDR ranges of the three VPCs.

output "hospital_vpc_ids" {
  description = "IDs of the hospital VPCs"

  value = {
    for name, vpc in aws_vpc.hospital :
    name => vpc.id
  }
}

output "hospital_vpc_cidr_blocks" {
  description = "CIDR blocks assigned to the hospital VPCs"

  value = {
    for name, vpc in aws_vpc.hospital :
    name => vpc.cidr_block
  }
}

output "hospital_vpc_details" {
  description = "Important details for each hospital VPC"

  value = {
    for name, vpc in aws_vpc.hospital :
    name => {
      vpc_id     = vpc.id
      cidr_block = vpc.cidr_block
      arn        = vpc.arn
    }
  }
}

output "hospital_subnet_ids" {
  description = "IDs of the hospital subnets"

  value = {
    for name, subnet in aws_subnet.hospital :
    name => subnet.id
  }
}

output "hospital_subnet_details" {
  description = "Details of the hospital subnets"

  value = {
    for name, subnet in aws_subnet.hospital :
    name => {
      subnet_id         = subnet.id
      cidr_block        = subnet.cidr_block
      availability_zone = subnet.availability_zone
      vpc_id            = subnet.vpc_id
    }
  }
}

#creates an output that displays the IDs of all the Internet Gateways (IGWs) created for hospital VPCs, organized by their names
output "hospital_internet_gateway_ids" {
  description = "IDs of the hospital Internet Gateways"

  value = {
    for name, igw in aws_internet_gateway.hospital :
    name => igw.id
  }
}

# To easily see the IDs and IP addresses of the three EC2 instances after Terraform creates them
output "hospital_ec2_instance_ids" {
  description = "IDs of the hospital EC2 instances"

  value = {
    for name, instance in aws_instance.hospital :
    name => instance.id
  }
}

output "hospital_ec2_private_ips" {
  description = "Private IP addresses of the hospital EC2 instances"

  value = {
    for name, instance in aws_instance.hospital :
    name => instance.private_ip
  }
}

output "hospital_ec2_public_ips" {
  description = "Public IP addresses of the hospital EC2 instances"

  value = {
    for name, instance in aws_instance.hospital :
    name => instance.public_ip
  }
}