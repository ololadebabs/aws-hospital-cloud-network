# Secure Hospital Cloud Network
# AWS Hospital Infrastructure
# This project demonstrates the design and deployment of a secure, scalable AWS cloud infrastructure for a hospital environment using Terraform Infrastructure as Code (IaC).
# The project makes use of Terraform to create foundational AWS network infrastructure for a fictional hospital environment.

## Purpose
#The infrastructure is designed as a foundational prototype for supporting:
#- Secure hospital applications
#- Healthcare data processing
#- Development and testing
#- Backup and disaster recovery
#- Future healthcare interoperability services

## Technologies
#- Amazon Web Services: VPC, EC2, IAM
#- AWS Automation: CLI
#- Visual Studio Code
#- Programming: Python, Java
#- Shell: Bash, Powershell
#- Version Control and Code Hosting: Git/GitHub
#- Infrastructure as Code: Terraform/HashiCorp Configuration Language
#- Operating Systems: Linux, Windows

## Learning Outcomes
#- Infrastructure as Code (Terraform)
#- AWS networking
#- Version control with Git and GitHub

## Notice
 # This project uses fictional infrastructure and does not contain real patient
 # information, protected health information, or production credentials.

## PROGRESS LOG
## Summary of Phase 1
# Initialized project
# Created GitHub repository
# Configured Git
# Created project structure

## Current Architecture
#Three logically separated Amazon VPCs were created:
#1. Clinical VPC  10.0.0.0/16
#2. Analytics VPC  10.1.0.0/16
#3. Admin VPC  10.2.0.0/16

## Folder Structure
#- .gitignore
#- .terraform.lock.hcl
#- README.md
#- outputs.tf
#- provider.tf
#- terraform.tfvars.example
#- variables.tf
#- versions.tf
#- vpc.tf

## Project Status
#-  Project initialized
#-  Git repository created
#-  VPC design and setup completed

## Professional Challenges Encountered
#While pushing the local Terraform project to GitHub, I encountered a Git repository synchronization issue because the remote repository had been initialized with a README, LICENSE, and .gitignore, creating a conflicting commit history. I resolved the issue by creating a new empty repository and successfully pushing the project, reinforcing my understanding of Git version control and repository management.


## Summary of Phase 2
 # Create subnet folder, then created subnet configurations
# Configured Internet Gateway



## Summary of Phase 3
 # Create and attach Igw
 #One important point: creating and attaching an Internet Gateway does not automatically make your subnets internet-accessible. You still need routes such as 0.0.0.0/0 → IGW in the appropriate route tables.

## Summary of Phase 4
 #Updating Route Tables
 #updating all three VPC route tables with a default route pointing at each VPC's Internet Gateway

 ## Summary of Phase 5
  #Deploy EC2 Instances in the VPCs
  #Objective
  #The objective of this task is to deploy one Amazon EC2 instance in each of the three hospital VPCs.
  #The EC2 instances will later be used to test private network communication between the VPCs and demonstrate that separate VPCs are isolated by default.
  #For the hospital infrastructure project, the three environments are: Clinical, Analytics and Admin 
  #VPC CIDR are 10.0.0.0/16, 10.1.0.0/16 and 10.2.0.0/16 respectively
  #The project deploys each EC2 instance into the AZ1 subnet of its respective VPC, following the lab's one-instance-per-VPC architecture.
  #The ec2 subnets are names clinical-az1, analytics-az1 and admin-az1 
  #The ec2 instances are hospital-clinical-ec2, hospital-analytics-ec2 and hospital-admin-ec2 respectively
  #Each ec2 instance is configured with: Operating System: Amazon Linux 2023
    #Instance Type: t2.micro
    #Public IPv4 Address: Enabled
    #SSH Access: Not configured
    #Remote Management: AWS Systems Manager Session Manager
    #Security Group: Allows ICMP traffic from 10.0.0.0/8
 #Skills Demonstrated: 
    #Amazon EC2 deployment, Amazon Linux 2023, AWS VPC networking, Multi-VPC architecture, AWS CLI resource verification,
    #Terraform data sources, EC2 security groups, IAM roles and instance profiles, AWS Systems Manager Session Manager, 
    #Terraform Infrastructure as Code, Terraform outputs, Terraform for_each, ICMP network configuration
 #Task Outcome:
    #Three EC2 instances are deployed, One EC2 instance exists in each hospital VPC, Each instance is deployed into its respective AZ1 subnet
    #ICMP traffic from the hospital private network range is permitted by the EC2 security groups
    #AWS Systems Manager access is configured without requiring SSH, Terraform outputs provide the instance IDs and private/public IP addresses
    #The three VPCs remain isolated from each other, preparing the environment for connectivity testing

## Summary of Phase 5
 #The goal is to prove that the three EC2 instances/servers in separate VPCs CANNOT COMMUNICATE WITH ONE ANOTHER YET. This will help to demonstrate
 #VPC isolation by default(i.e. no inter-VPC routing mechanism)


 ## Summary of Phase 5
  #We set up VPC Peering to establish connection between isolated VPCs privately over AWS networking infrastructure

