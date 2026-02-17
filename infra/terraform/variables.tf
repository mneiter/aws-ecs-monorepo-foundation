variable "project_name" {
  description = "Project name prefix for resources."
  type        = string
}

variable "environment" {
  description = "Environment name, for example dev/stage/prod."
  type        = string
}

variable "aws_region" {
  description = "AWS region for deployment."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Two CIDR blocks for public subnets."
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "public_subnet_cidrs must contain exactly 2 CIDR blocks."
  }
}

variable "private_subnet_cidrs" {
  description = "Two CIDR blocks for private subnets."
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_cidrs) == 2
    error_message = "private_subnet_cidrs must contain exactly 2 CIDR blocks."
  }
}

variable "azs" {
  description = "Availability zones to use. Provide exactly 2 values."
  type        = list(string)

  validation {
    condition     = length(var.azs) == 2
    error_message = "azs must contain exactly 2 availability zones."
  }
}

variable "web_image" {
  description = "Container image URI for the web service."
  type        = string
}

variable "api_image" {
  description = "Container image URI for the api service."
  type        = string
}

variable "web_desired_count" {
  description = "Desired task count for web service."
  type        = number
  default     = 1
}

variable "web_min_count" {
  description = "Minimum task count for web autoscaling."
  type        = number
  default     = 1
}

variable "web_max_count" {
  description = "Maximum task count for web autoscaling."
  type        = number
  default     = 3
}

variable "api_desired_count" {
  description = "Desired task count for api service."
  type        = number
  default     = 1
}

variable "api_min_count" {
  description = "Minimum task count for api autoscaling."
  type        = number
  default     = 1

  validation {
    condition     = var.api_min_count >= 1
    error_message = "api_min_count must be at least 1."
  }
}

variable "api_max_count" {
  description = "Maximum task count for api autoscaling."
  type        = number
  default     = 3
}

variable "web_cpu" {
  description = "CPU units for the web task definition."
  type        = number
  default     = 256
}

variable "web_memory" {
  description = "Memory (MiB) for the web task definition."
  type        = number
  default     = 512
}

variable "api_cpu" {
  description = "CPU units for the api task definition."
  type        = number
  default     = 256
}

variable "api_memory" {
  description = "Memory (MiB) for the api task definition."
  type        = number
  default     = 512
}
