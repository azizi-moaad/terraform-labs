output "cloudfront_domain_name" {
  value       = "https://${aws_cloudfront_distribution.cdn.domain_name}"
  description = "The HTTPS URL of the CloudFront distribution"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.website_bucket.id
  description = "The name of the S3 bucket created"
}
