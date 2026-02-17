# Foundation Scope

## 1. In scope

1. Nx monorepo baseline with `apps/web`, `apps/api`, `libs/contracts`, and `infra/terraform`.
2. API baseline with Fastify and `GET /api/health`.
3. Web baseline with Next.js static export served by nginx.
4. Docker image build support for web and API services.
5. Terraform baseline for:
   1. VPC, subnets, route tables, internet gateway, and one NAT gateway.
   2. ALB with HTTP listener on port 80.
   3. Path routing rule for `/api/*` to API target group.
   4. Default route to web target group.
   5. ECS cluster and two Fargate services.
   6. ECR repositories for web and API images.
   7. CloudWatch log groups for web and API.
   8. Service autoscaling policies with API minimum count set to 1.
6. Baseline documentation for architecture, scope, decisions, and verification.

## 2. Out of scope

1. HTTPS listener on port 443 and ACM certificate integration.
2. WAF, Shield, and advanced edge security controls.
3. CI workflow implementation and release pipeline automation.
4. Remote Terraform backend and state locking configuration.
5. Secret rotation workflows and full application security model.
6. Advanced observability platform such as tracing and SLO automation.
7. Blue green or canary deployment strategies.

## 3. Environments, dev stage prod

1. Dev:
   1. Planned now.
   2. Manual apply supported with local Terraform state.
2. Stage:
   1. Planned later.
   2. Requires CI plan automation and remote state controls first.
3. Prod:
   1. Planned later.
   2. Requires HTTPS, approval gates, and stronger operational controls first.

## 4. Non goals

1. Replace all future platform decisions in this phase.
2. Build full product runtime features in this phase.
3. Introduce complex orchestration that increases maintenance cost before baseline stabilization.
4. Claim production compliance readiness in this phase.
