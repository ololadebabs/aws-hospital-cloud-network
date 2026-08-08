#This block configures the AWS provider, telling Terraform which AWS account/region to use and automatically tagging every supported AWS resource it creates.
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "AWS Hospital Infrastructure"
      ManagedBy   = "Terraform"
      Environment = "Learning"
      Owner       = "Babatunde Adigun"
    }
  }
}