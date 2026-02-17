# aws-ecs-monorepo-foundation

Production-oriented AWS ECS Fargate foundation with an Nx monorepo and Terraform infrastructure.

## Current Implementation Status

Implemented in `feat/ecs-nx-foundation`:

- Nx workspace with `apps/web`, `apps/api`, `libs/contracts`, and `infra/terraform`
- `web`: Next.js static export (`output: 'export'`) served by nginx
- `api`: Fastify service exposing `GET /api/health`
- Shared `HealthResponse` contract in `libs/contracts` used by both apps
- Dockerfiles for local image build and runtime checks
- Terraform foundation for VPC, ALB path routing, ECS/Fargate services, ECR, CloudWatch logs, and autoscaling

## Repository Layout

- `apps/web`: Next.js static export app
- `apps/api`: Fastify API service
- `libs/contracts`: shared TypeScript contracts/types
- `infra/terraform`: AWS infrastructure (split `.tf` files)
- `docs/program`: project program, implementation plan, and verification notes

## Getting Started

### Requirements

- Node.js 22.x
- npm 10.x
- Docker
- Terraform >= 1.6.0
- AWS credentials configured for Terraform apply

### Install dependencies

```bash
npm install
```

### Run locally

Run API on port 3000:

```bash
npx nx serve api
```

Run web on a different port (to avoid conflict with API):

```bash
PORT=4200 npx nx dev web
```

Health check:

```bash
curl -i http://localhost:3000/api/health
```

### Run tests and checks

```bash
npm run build
npm run test
npm run lint
npm run typecheck
```

## Docker

### Build images

```bash
docker build -f apps/api/Dockerfile -t foundation-api:local .
docker build -f apps/web/Dockerfile -t foundation-web:local .
```

### How Dockerfiles are structured

- `apps/api/Dockerfile`: Node multi-stage build, Nx production build, runtime starts `main.js` on port `3000`
- `apps/web/Dockerfile`: Node build stage for Next export, nginx runtime serves `apps/web/out` on port `80`

### Local container verification

```bash
docker run --rm -d --name foundation-api-test -p 5000:3000 foundation-api:local
curl -i http://localhost:5000/api/health
docker logs foundation-api-test
docker stop foundation-api-test

docker run --rm -d --name foundation-web-test -p 6000:80 foundation-web:local
curl -i http://localhost:6000/
docker logs foundation-web-test
docker stop foundation-web-test
```

## Infrastructure (Terraform)

Terraform in `infra/terraform` provisions:

- VPC with two public and two private subnets
- Internet Gateway + single NAT Gateway
- ECS cluster with two Fargate services (`web`, `api`)
- One ALB on `:80` with path-based routing:
  - `/api/*` -> API target group (priority `100`)
  - default -> web target group
- CloudWatch log groups (one per service)
- App Auto Scaling policies (API min count enforced to `1`)

### Init, plan, apply

```bash
cd infra/terraform
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt -check
terraform validate
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

### Required variables

Set in `infra/terraform/terraform.tfvars`:

- Identity/context: `project_name`, `environment`, `aws_region`
- Network: `vpc_cidr`, `public_subnet_cidrs` (2), `private_subnet_cidrs` (2), `azs` (2)
- Images: `web_image`, `api_image`
- Service scaling: `web_desired_count`, `web_min_count`, `web_max_count`, `api_desired_count`, `api_min_count`, `api_max_count`
- Task sizing: `web_cpu`, `web_memory`, `api_cpu`, `api_memory`

Use `infra/terraform/terraform.tfvars.example` as the starting template.

### Expected outputs

```bash
terraform output
```

Key outputs include:

- `alb_dns_name`
- `ecs_cluster_arn`
- `web_service_name`
- `api_service_name`
- `web_target_group_arn`
- `api_target_group_arn`

### Test ALB routing after apply

```bash
ALB_DNS=$(terraform output -raw alb_dns_name)
curl -i "http://${ALB_DNS}/"
curl -i "http://${ALB_DNS}/api/health"
```

Expected:

- `/` returns web content
- `/api/health` returns `200` with JSON health payload

## Verification Checklist

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

Optional post-apply checks:

```bash
curl "http://$(terraform output -raw alb_dns_name)/"
curl -i "http://$(terraform output -raw alb_dns_name)/api/health"
```

## Next Steps and Out of Scope

Out of scope in this iteration:

- HTTPS listener `:443` and ACM certificate wiring
- CI/CD pipelines and required status checks
- Remote Terraform backend/state locking
- Secrets management and application authn/authz flows
- Observability hardening beyond baseline ECS logs and ALB health checks

Planned next steps:

- Add HTTPS/ACM and HTTP->HTTPS redirect
- Add CI with build/test/image/terraform plan workflows
- Add environment promotion and remote state strategy

## Program Documentation

- `docs/program/PROJECT_PROGRAM.md`
- `docs/program/CODEX_PLAN_NX_ECS_FARGATE_FOUNDATION.md`

## Security and Governance

- Security reporting: `SECURITY.md`
- Contributor expectations: `CONTRIBUTING.md`
- Community standards: `CODE_OF_CONDUCT.md`
