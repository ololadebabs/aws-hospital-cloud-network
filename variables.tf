#This variable expects a map containing the configuration for each VPC.
variable "aws_region" {
  description = "AWS region where the hospital infrastructure will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "hospital_vpcs" {
  description = "Configuration for the hospital VPCs"

  type = map(object({
    cidr_block  = string
    environment = string
    purpose     = string
  }))
}