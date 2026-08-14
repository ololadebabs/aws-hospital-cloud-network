#Define which subnet each ec2 instance uses
#This places one EC2 instance in the AZ1 subnet of each VPC.
locals {
  hospital_ec2_instances = {
    clinical = {
      subnet_key = "clinical-az1"
      name       = "hospital-clinical-ec2"
    }

    analytics = {
      subnet_key = "analytics-az1"
      name       = "hospital-analytics-ec2"
    }

    admin = {
      subnet_key = "admin-az1"
      name       = "hospital-admin-ec2"
    }
  }
}

#Creation of instances
resource "aws_instance" "hospital" {
  for_each = local.hospital_ec2_instances

  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"

  subnet_id = aws_subnet.hospital[each.value.subnet_key].id

  associate_public_ip_address = true #enables auto-assign public ip

  vpc_security_group_ids = [
    aws_security_group.hospital_ec2[each.key].id
  ]

  iam_instance_profile = aws_iam_instance_profile.hospital_ec2_ssm_profile.name

  tags = {
    Name        = each.value.name
    Environment = title(each.key)
  }
}