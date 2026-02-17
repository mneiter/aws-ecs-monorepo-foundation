output "alb_dns_name" {
  description = "Public DNS name for the Application Load Balancer."
  value       = aws_lb.main.dns_name
}

output "vpc_id" {
  description = "VPC ID."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs."
  value       = aws_subnet.private[*].id
}

output "ecs_cluster_arn" {
  description = "ECS cluster ARN."
  value       = aws_ecs_cluster.main.arn
}

output "web_service_name" {
  description = "Web ECS service name."
  value       = aws_ecs_service.web.name
}

output "api_service_name" {
  description = "API ECS service name."
  value       = aws_ecs_service.api.name
}

output "web_target_group_arn" {
  description = "Web target group ARN."
  value       = aws_lb_target_group.web.arn
}

output "api_target_group_arn" {
  description = "API target group ARN."
  value       = aws_lb_target_group.api.arn
}

output "alb_security_group_id" {
  description = "ALB security group ID."
  value       = aws_security_group.alb.id
}

output "web_service_security_group_id" {
  description = "Web service security group ID."
  value       = aws_security_group.web_service.id
}

output "api_service_security_group_id" {
  description = "API service security group ID."
  value       = aws_security_group.api_service.id
}

output "web_ecr_repository_url" {
  description = "ECR URL for web image."
  value       = aws_ecr_repository.web.repository_url
}

output "api_ecr_repository_url" {
  description = "ECR URL for api image."
  value       = aws_ecr_repository.api.repository_url
}
