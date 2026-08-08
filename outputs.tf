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