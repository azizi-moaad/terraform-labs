output "alb_dns_name" {
  description = "Public DNS name of the ALB"
  value       = aws_lb.web_alb.dns_name
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "private_subnet_ids" {
  description = "List ot private subnets IDs"
  value       = [for s in aws_subnet.private : s.id]
}
