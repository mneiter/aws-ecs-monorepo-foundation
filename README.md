# aws-ecs-monorepo-foundation

Production-oriented AWS ECS Fargate foundation using:

- Nx monorepo
- Next.js (static export)
- TypeScript backend (Fastify)
- Docker
- Terraform
- GitHub Actions with OIDC
- Region: us-east-1

---

## Project Goals

This repository serves as a learning and reference implementation for:

- Fullstack containerized architecture
- Infrastructure as Code with Terraform
- CI/CD via GitHub Actions
- Production-grade repository governance
- Multi-agent assisted development workflows

---

## Architecture Overview

- ALB (HTTP/HTTPS)
- ECS Fargate services:
  - web (Next.js static via nginx)
  - api (TypeScript Fastify service)
- ECR repositories
- Terraform remote state (S3 + DynamoDB lock)

---

## Local Development

This repository is intentionally governance-first and may not include an Nx workspace in every revision.

### Once an Nx workspace exists
```bash
npm ci
npx nx serve web
npx nx serve api
```

See: [CONTRIBUTING.md](CONTRIBUTING.md), [SECURITY.md](SECURITY.md), [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)
