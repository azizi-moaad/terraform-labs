output "alb_dns_name" {
  description = "Public URL for the ECS application load balancer"
  value       = module.ecs.alb_dns_name
}

output "rds_endpoint" {
  description = "Private address for PostgreSQL instance"
  value       = module.rds.db_endpoint
}

output "secrets_manager_arn" {
  description = "ARN of the AWS Secrets Manager entry storing DB credentials"
  value       = module.rds.secret_arn
}