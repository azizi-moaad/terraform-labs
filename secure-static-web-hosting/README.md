# Secure Static Web Hosting Architecture

This blueprint implements a private S3 storage container connected exclusively to a global CloudFront distribution, completely isolating the storage layer from direct public internet routing.

## Structural Highlights

* **Edge Routing & Caching:** CloudFront serves content globally via low-latency edge locations, caching static web assets and enforcing HTTPS redirection.
* **Storage Isolation:** The S3 bucket blocks all public access policies and ACLs, delegating read permissions strictly to CloudFront via an IAM bucket policy tied to the CDN's Origin Access Control (OAC).
* **Automated Asset Sync:** Dynamic fileset iteration and MD5 hash evaluation upload local web assets while setting correct MIME content types.

## Getting Started

1. Configure environment variables by copying the template file:
```bash
cp terraform.tfvars.example terraform.tfvars
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

5. Retrieve the live HTTPS endpoint from the output:
```bash
terraform output cloudfront_domain_name
```