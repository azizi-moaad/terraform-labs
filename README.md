# Terraform Infrastructure Labs

A curated collection of production-ready Infrastructure as Code (IaC) blueprints, automated cloud architectures, and declarative AWS configurations.

## Available Blueprints

* **[Secure Static Web Hosting](./secure-static-web-hosting):** Implements a private S3 bucket origin fronted by a global CloudFront CDN distribution with Origin Access Control (OAC), restricting direct internet access to the bucket.
* **[VPC EC2 Auto Scaling](./vpc-ec2-autoscaling):** Provisions a highly available 2-tier architecture featuring multi-AZ public and private subnets, NAT Gateways, an Application Load Balancer, and a self-healing Auto Scaling Group.
* *(More infrastructure blueprints coming soon...)*

## Core Architecture Concepts Demonstrated

* **Multi-AZ High Availability:** Redundant VPC design spanning multiple Availability Zones with isolated subnets and independent NAT Gateways per zone.
* **Security Group Chaining:** Zero-trust perimeter isolation restricting private web tier access exclusively to traffic originating from the Application Load Balancer.
* **Self-Healing Compute:** Dynamic EC2 instance management using Launch Templates, Auto Scaling Groups, and ELB target health checks.
* **Origin Access Control (OAC):** Enforces strict identity-based access between edge networks and object storage using SigV4 authentication.
* **Zero-Public Storage Security:** Complete mitigation of public S3 exposure using automated `aws_s3_bucket_public_access_block` bucket guardrails.
* **Declarative Asset Deployment:** Automated local-to-cloud file synchronization using dynamic file-set hashing and content-type mapping.
* **Automated CI/CD Validation:** Automated syntax validation and configuration verification on every repository push.