# 2-Tier Automated VPC & EC2 Auto Scaling Architecture

This blueprint provisions a production-grade, highly available 2-tier infrastructure on AWS. Public ingress traffic is received by an Application Load Balancer across multiple Availability Zones, which proxies requests to a stateless web tier running inside private subnets managed by an Auto Scaling Group.

## Architecture Diagram

```text
                      [ Internet Gateway ]
                               │
               ┌───────────────┴───────────────┐
               │    VPC (10.0.0.0/16)          │
               │                               │
       [ Public Subnet A ]           [ Public Subnet B ]
      (us-east-1a / 10.0.1.0/24)   (us-east-1b / 10.0.2.0/24)
               │                               │
        ┌──────┴───────────────────────────────┴──────┐
        │        Application Load Balancer (ALB)      │
        └──────┬───────────────────────────────┬──────┘
               │                               │
        [ NAT Gateway A ]             [ NAT Gateway B ]
               │                               │
 ──────────────┼───────────────────────────────┼──────────────
               │   (Private Subnet Boundary)   │
               ▼                               ▼
      [ Private Subnet A ]           [ Private Subnet B ]
     (us-east-1a / 10.0.10.0/24)   (us-east-1b / 10.0.20.0/24)
               │                               │
               └───────────────┬───────────────┘
                               │
                [ Auto Scaling Group (EC2) ]
                  (Apache/Nginx Web Server)

```

## Structural Highlights

* **High Availability Networking:** Multi-AZ VPC design spanning `us-east-1a` and `us-east-1b`, featuring independent public and private subnets, dedicated NAT Gateways per AZ, and explicit route tables.
* **Perimeter & Tiered Security:** Security Group Chaining guarantees private EC2 web servers accept port 80 traffic strictly from the Application Load Balancer (`alb_sg`). Instances lack public IP addresses and route outbound traffic securely through NAT Gateways.
* **Self-Healing Compute Layer:** Auto Scaling Group (`min: 2`, `max: 4`) utilizes Amazon Linux 2023 Launch Templates and ELB-based health checks to automatically replace non-responsive instances.
* **Dynamic Bootstrapping:** System startup scripts extract IMDSv2 metadata (Instance ID, AZ) to serve dynamic HTML responses verifying load balancer target distribution.

## Getting Started

1. Navigate to the project directory:

```bash
cd vpc-ec2-autoscaling

```

2. Initialize provider plugins and modules:

```bash
terraform init

```

3. Inspect the proposed execution plan:

```bash
terraform plan

```

4. Deploy the infrastructure stack:

```bash
terraform apply -auto-approve

```

5. Retrieve the live ALB DNS endpoint from the output:

```bash
terraform output alb_dns_name

```