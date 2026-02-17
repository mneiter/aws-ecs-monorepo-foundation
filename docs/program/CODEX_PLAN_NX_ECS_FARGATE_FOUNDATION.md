# CODEX Plan: Nx + ECS Fargate Foundation

## Plan Objective

Implement a minimal, production-oriented baseline for:

- Nx monorepo (`apps/web`, `apps/api`, `libs/contracts`, `infra/terraform`)
- Web static export hosted by nginx
- Fastify API with `/api/health`
- Terraform for ALB + ECS Fargate (`web` and `api`) with path-based routing and autoscaling

## Locked Defaults

- NAT gateway: single NAT
- Terraform backend: local state first
- ECS baseline sizing:
  - `web`: `256` CPU / `512` MiB
  - `api`: `256` CPU / `512` MiB

## Implementation Status

Completed:

- Nx workspace initialized and configured with strict TypeScript
- API service implemented with typed `GET /api/health`
- Web app configured with `output: 'export'` and minimal index page
- Shared contracts library implemented and used by both apps
- Dockerfiles implemented for API and web images
- Terraform split-file foundation implemented:
  - networking
  - security groups
  - ECR repositories
  - ECS cluster/services/task definitions
  - ALB listener + `/api/*` rule
  - autoscaling targets/policies
  - outputs and example tfvars
- Root scripts documented and available via npm

## Verification Commands (Exact)

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
terraform apply -var-file=terraform.tfvars
curl "http://$(terraform output -raw alb_dns_name)/"
curl -i "http://$(terraform output -raw alb_dns_name)/api/health"
```

## Acceptance Criteria

- API health endpoint returns `200` behind ALB path `/api/health`
- Root ALB path `/` serves web static content
- CloudWatch log groups exist for both services
- Terraform plan/apply works in a new AWS account with required variables

## Deferred Work

- HTTPS/ACM listener on `:443`
- WAF and advanced edge/security policies
- CI/CD and required status checks
- Remote backend/state locking
- Progressive delivery or blue/green rollout strategy
