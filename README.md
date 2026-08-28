# Terraform Infrastructure Labs

A curated collection of production-ready Infrastructure as Code (IaC) blueprints, automated cloud architectures, and declarative AWS configurations.

## Available Blueprints

* **[Secure Static Web Hosting](./secure-static-web-hosting):** Implements a private S3 bucket origin fronted by a global CloudFront CDN distribution with Origin Access Control (OAC), restricting direct internet access to the bucket.
* *(More infrastructure blueprints coming soon...)*

## Core Architecture Concepts Demonstrated

* **Origin Access Control (OAC):** Enforces strict identity-based access between edge networks and object storage using SigV4 authentication.
* **Zero-Public Storage Security:** Complete mitigation of public S3 exposure using automated `aws_s3_bucket_public_access_block` bucket guardrails.
* **Declarative Asset Deployment:** Automated local-to-cloud file synchronization using dynamic file-set hashing and content-type mapping.
* **Automated CI/CD Validation:** Automated syntax validation and configuration verification on every repository push.