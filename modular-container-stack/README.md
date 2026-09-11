# Modular Container Stack

This blueprint refactors a monolithic Terraform configuration into DRY, reusable child modules, provisioning a VPC, an ECS Fargate service, and an RDS PostgreSQL instance behind a root-module orchestration layer.

## Structural Highlights

* **Modular Orchestration:** The root `main.tf` acts purely as an orchestrator, wiring together three independent child modules (`vpc`, `ecs`, `rds`) and passing outputs from one as inputs to another.
* **Network Segmentation:** The VPC module carves out public, private, and isolated database subnets across multiple AZs, with per-AZ NAT gateways and route tables so app traffic and database traffic never share a path.
* **Tiered Security Isolation:** The RDS security group accepts inbound PostgreSQL traffic only from the ECS task security group; the ECS tasks in turn accept traffic only from the ALB.
* **Secret Management via IAM & Secrets Manager:** Database credentials are generated programmatically with `random_password`, stored in AWS Secrets Manager, and injected into the ECS task at runtime — never hardcoded or exposed in plaintext.
* **State Isolation via Workspaces:** Run `terraform workspace new prod` to provision parallel, isolated environments (`prod-vpc`, `prod-postgres`, `prod-ecs`) from the same module files.

## Getting Started

1. Configure environment variables by copying the template file:
```bash
cp terraform.tfvars.example terraform.tfvars
```

2. Format code recursively:
```bash
terraform fmt -recursive
```

3. Initialize provider plugins and modules:
```bash
terraform init
```

4. Inspect the proposed execution plan:
```bash
terraform plan
```

5. Deploy the infrastructure stack:
```bash
terraform apply -auto-approve
```

6. Retrieve the live application endpoint from the output:
```bash
terraform output alb_dns_name
```