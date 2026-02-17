# Project Program: Nx + ECS Fargate Foundation

## Purpose

This repository provides a production-oriented starting point for an AWS ECS Fargate deployment using an Nx monorepo.  
The goal of this phase is to establish the minimum viable foundation for web + API services, containerization, and infrastructure provisioning.

## Scope Delivered (Current Phase)

- Nx monorepo structure:
  - `apps/web` (Next.js static export)
  - `apps/api` (Fastify API)
  - `libs/contracts` (shared TypeScript contracts)
  - `infra/terraform` (AWS infrastructure)
- API endpoint:
  - `GET /api/health` returns `200` and a typed health payload
- Web serving model:
  - Static export served by nginx in container runtime
- Docker:
  - Buildable images for `foundation-api:local` and `foundation-web:local`
- Terraform foundation:
  - VPC, public/private subnets, IGW, single NAT gateway
  - ECS cluster and two ECS services (`web`, `api`) on Fargate
  - ALB with HTTP listener (`:80`) and path routing:
    - `/api/*` -> API target group
    - default -> web target group
  - CloudWatch log groups for both services
  - Service autoscaling with API minimum task count enforced to `1`

## Key Decisions

- NAT strategy: single NAT gateway (cost-aware baseline)
- Terraform state: local state first (backend deferred)
- ECS baseline sizing:
  - `web_cpu = 256`, `web_memory = 512`
  - `api_cpu = 256`, `api_memory = 512`
- Region default: `us-east-1`

## Verification Workflow

Run from repository root unless noted:

```bash
npm install
npx nx graph
npx nx build api
npx nx build web
npx nx test api
npx nx test web
npx nx test contracts
docker build -f apps/api/Dockerfile -t foundation-api:local .
docker build -f apps/web/Dockerfile -t foundation-web:local .
cd infra/terraform
terraform init
terraform fmt -check
terraform validate
terraform plan -var-file=terraform.tfvars
```

Post-apply runtime checks:

```bash
curl "http://$(terraform output -raw alb_dns_name)/"
curl -i "http://$(terraform output -raw alb_dns_name)/api/health"
```

## Required Terraform Inputs

Populate `infra/terraform/terraform.tfvars` using `terraform.tfvars.example`:

- `project_name`, `environment`, `aws_region`
- `vpc_cidr`, `public_subnet_cidrs`, `private_subnet_cidrs`, `azs`
- `web_image`, `api_image`
- `web_desired_count`, `web_min_count`, `web_max_count`
- `api_desired_count`, `api_min_count`, `api_max_count`
- `web_cpu`, `web_memory`, `api_cpu`, `api_memory`

## Expected Terraform Outputs

- `alb_dns_name`
- `ecs_cluster_arn`
- `web_service_name`
- `api_service_name`
- `web_target_group_arn`
- `api_target_group_arn`
- ECR repository URLs and security group IDs

## Out of Scope (This Phase)

- HTTPS listener (`:443`) with ACM
- CI/CD workflow automation
- Remote Terraform backend and locking
- Secrets management and service auth hardening
- Production-grade observability stack beyond baseline logs and health checks

## Next Program Milestones

1. Add HTTPS + ACM with redirect from `:80` to `:443`
2. Add CI for build/test/container/terraform plan
3. Introduce remote Terraform backend
4. Add environment-specific deployment workflow and promotion model
