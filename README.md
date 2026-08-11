## Progress Log
### Day 1
- Initialized project
- Created GitHub repository
- Configured Git
- Created project structure

### Day 2
- Built VPC
- Created public and private subnets
- Configured Internet Gateway

## SUMMARY AFTER PHASE 1
# Secure Hospital Cloud Network
# AWS Hospital Infrastructure
This project demonstrates the design and deployment of a secure, scalable AWS cloud infrastructure for a hospital environment using Terraform Infrastructure as Code (IaC).
The project makes use of Terraform to create foundational AWS network infrastructure for a fictional hospital environment.

## Current Architecture
The project creates three logically separated Amazon VPCs:

1. Clinical VPC — `10.0.0.0/16`
2. Analytics VPC — `10.1.0.0/16`
3. Admin VPC — `10.2.0.0/16`

## Purpose
The infrastructure is designed as a foundational prototype for supporting:
- Secure hospital applications
- Healthcare data processing
- Development and testing
- Backup and disaster recovery
- Future healthcare interoperability services

## Technologies
- Amazon Web Services: VPC, EC2, IAM
- AWS Automation: CLI
- Visual Studio Code
- Programming: Python, Java
- Shell: Bash, Powershell
- Version Control & Code Hosting: Git & GitHub
- Infrastructure as Code: Terraform/HashiCorp Configuration Language
- Operating Systems: Linux, Windows

## Folder Structure
- .gitignore
- .terraform.lock.hcl
- README.md
- outputs.tf
- provider.tf
- terraform.tfvars.example
- variables.tf
- versions.tf
- vpc.tf

## Project Status
- ✅ Project initialized
- ✅ Git repository created
- ✅ VPC design & set up completed
- ⏳ Creation of Subnet in progress

## Professional Challenges Encountered
While pushing the local Terraform project to GitHub, I encountered a Git repository synchronization issue because the remote repository had been initialized with a README, LICENSE, and .gitignore, creating a conflicting commit history. I resolved the issue by creating a new empty repository and successfully pushing the project, reinforcing my understanding of Git version control and repository management.

## Learning Outcomes
- Infrastructure as Code (Terraform)
- AWS networking
- Version control with Git and GitHub

## Security Notice
This project uses fictional infrastructure and does not contain real patient
information, protected health information, or production credentials.


## SUMMARY AFTER PHASE 2
create subnet folder, then add subnet configurations
