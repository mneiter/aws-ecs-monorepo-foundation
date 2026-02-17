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

```bash
npm ci
nx serve web
nx serve api
