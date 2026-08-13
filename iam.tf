#Creates ssm iam role because we will use System Manager Session Manager insteda of ssh
resource "aws_iam_role" "hospital_ec2_ssm_role" {
  name = "hospital-ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "hospital-ec2-ssm-role"
  }
}

#attach aws-managed ssm policy(we connect through session manager without opening ssh port 22)
resource "aws_iam_role_policy_attachment" "hospital_ssm_policy" {
  role       = aws_iam_role.hospital_ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

#create instance profile
resource "aws_iam_instance_profile" "hospital_ec2_ssm_profile" {
  name = "hospital-ec2-ssm-profile"
  role = aws_iam_role.hospital_ec2_ssm_role.name
}