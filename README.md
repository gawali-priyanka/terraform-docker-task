## Infrastructure as Code with Terraform & Docker
---
Task-3
---
Objective
Provision a Docker container using Terraform on an AWS EC2 (Amazon Linux 2) instance, demonstrating Infrastructure as Code (IaC) concepts.
---
## Tech Stack
1) Platform: AWS EC2
2) Docker v25.0.8
3) Terraform v1.8.2
4) NGINX Docker Image
5) Security Group: TCP 8080 open for external access
---
## Steps Performed
1) Installed Docker and Terraform on EC2
2) Wrote a Terraform config (main.tf) using kreuzwerker/docker provider
3) Initialized Terraform using terraform init
4) Planned infrastructure with terraform plan
5) Applied config using terraform apply (ran nginx on port 8080)
6) Verified browser access to http://<ec2-ip>:8080
7) Destroyed infrastructure using terraform destroy
 ---  
## Screenshots
NGINX Running in Browser
 ![Alt Text]( ![Alt Text](https://github.com/gawali-priyanka/Jenkins-pipeline-task/blob/main/screenshots/Static-Web-App.png?raw=true))

Docker Container Running
 ![Alt Text](https://github.com/gawali-priyanka/terraform-docker-task/blob/main/screenshort/Create-docker-container.png?raw=true)

## How to Run This 
1) SSH into your EC2 instance
2) Install Docker & Terraform (commands in this repo)
3) Clone this repo:
   
   Commands-   git clone https://github.com/gawali-priyanka/terraform-docker-task.git
             cd devops-task-3
             
4) Run:
terraform init
terraform apply

5) Open browser: http://<ec2-ip>:8080
To clean up: terraform destroy
---

## INTERVIWE QUESTIONS 
---

1. What is IaC (Infrastructure as Code)?

   Ans: IaC is a process of managing and provisioning infrastructure (servers, networks, databases, etc.) using code rather than manual configuration.

   It allows version control, automation, reproducibility, and reduces human errors.

   Tools: Terraform, Ansible, CloudFormation, Pulumi.
---
2. How does Terraform work?

    Ans: Terraform uses configuration files (.tf) to define infrastructure resources.

   It creates an execution plan using terraform plan and provisions infrastructure using terraform apply.

   Terraform communicates with cloud providers via providers to create, update, or delete resources.

    It maintains state files to track current infrastructure.
---
3. What is a Terraform state file?

    Ans: A state file (terraform.tfstate) stores the current state of infrastructure.

    It keeps track of resources managed by Terraform and their metadata.

    Helps Terraform understand changes to apply during apply.

    Can be stored locally or remotely (S3, Terraform Cloud) for team collaboration.
---
4. Difference between terraform plan and terraform apply:

    Ans: Command	Purpose
    terraform plan	Generates an execution plan showing what changes Terraform will make. No resources are created or modified.
     terraform apply	Executes the plan and actually provisions, updates, or deletes resources.

5. What are Terraform providers?
---
    Ans: Providers are plugins that allow Terraform to interact with cloud services and APIs.

    They define which resources and services Terraform can manage.

    Examples: AWS, Azure, GCP, Kubernetes.

Declared in .tf files like:

  provider "aws" {
  region = "us-east-1"
 }


6. What is resource dependency in Terraform?

   Ans: Dependencies ensure resources are created or modified in the correct order.

   Terraform automatically detects dependencies via references between resources.

    Example: An EC2 instance might depend on a VPC or Security Group.

 resource "aws_instance" "web" { <br>
  ami           = "ami-12345" <br>
  instance_type = "t2.micro" <br>
  vpc_security_group_ids = [aws_security_group.sg.id] <br>
} <br>

---

7. How do you handle secret variables in Terraform?

   Ans: Secrets should never be hardcoded in .tf files.

   Methods to manage secrets:

   Environment variables: TF_VAR_password="secret123"

   Terraform variables with sensitive = true

    Remote state with encryption
   ---

## Secrets managers: AWS Secrets Manager, HashiCorp Vault
---
8. Explain the benefits of Terraform:

Ans: Declarative syntax: Define “what” you want, not “how”.

Idempotency: Applying multiple times produces the same result.

Infrastructure versioning: Track changes in Git.

Multi-cloud support: Works with AWS, Azure, GCP, Kubernetes, etc.

Automation: Reduces manual configuration and human error.

Collaboration: Remote state allows multiple team members to work together safely.
