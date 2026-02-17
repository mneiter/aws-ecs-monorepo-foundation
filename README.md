# aws-ecs-monorepo-foundation

Production-oriented AWS ECS Fargate foundation with:

- Nx monorepo (`apps/web`, `apps/api`, `libs/contracts`)
- Next.js static web app served by nginx
- Fastify API with `/api/health`
- Terraform infrastructure for VPC, ALB, ECS, ECR, logs, and autoscaling
- Region default: `us-east-1`

## Repository Layout

- `apps/web`: Next.js static export app
- `apps/api`: Fastify API service
- `libs/contracts`: shared TypeScript contracts/types
- `infra/terraform`: AWS infrastructure

## Local Development

1. Install dependencies:

```bash
npm install
```

2. Run app services:

```bash
npx nx serve api
npx nx dev web
```

3. Run workspace checks:

```bash
npm run build
npm run test
npm run lint
npm run typecheck
```

## Docker Build

Build API image:

```bash
docker build -f apps/api/Dockerfile -t foundation-api:local .
```

Build web image:

```bash
docker build -f apps/web/Dockerfile -t foundation-web:local .
```

## Terraform Apply

1. Move into Terraform directory:

```bash
cd infra/terraform
```

2. Create vars file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

3. Update `terraform.tfvars` values for your account (especially `web_image`, `api_image`, and `azs`).

4. Initialize and validate:

```bash
terraform init
terraform fmt -check
terraform validate
```

5. Plan and apply:

```bash
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## Verify ALB Routing

After `terraform apply`:

```bash
ALB_DNS=$(terraform output -raw alb_dns_name)
curl "http://${ALB_DNS}/"
curl -i "http://${ALB_DNS}/api/health"
```

Expected behavior:

- `/` returns web content from nginx/Next static export
- `/api/health` returns `200` with JSON health payload from API service

## Security and Governance

- Security reporting: `SECURITY.md`
- Contributor expectations: `CONTRIBUTING.md`
- Community standards: `CODE_OF_CONDUCT.md`
