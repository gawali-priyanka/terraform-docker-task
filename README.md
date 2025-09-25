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
