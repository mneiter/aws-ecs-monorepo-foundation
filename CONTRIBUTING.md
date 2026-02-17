# Contributing to aws-ecs-monorepo-foundation

This guide outlines contribution standards for this repository.

## Quick Start (Running Locally)

1. Install prerequisites:
   - Node.js (LTS)
   - Docker Desktop
   - Terraform CLI

2. Install dependencies:

```bash
npm install
```

3. Run applications:

```bash
npx nx serve api
npx nx dev web
```

4. Validate changes:

```bash
npm run build
npm run test
npm run lint
npm run typecheck
```

## Security and Secrets Policy

- Do not commit secrets or credentials.
- Use local env files for local-only values.
- Inject production secrets at runtime via AWS Secrets Manager or SSM Parameter Store.

## Standards

### Branching Strategy

- `feat/<scope>` for features
- `fix/<scope>` for bug fixes
- `chore/<scope>` for maintenance
- `docs/<scope>` for documentation

### Commit Messages

Use Conventional Commits, for example:

- `feat: add api health endpoint`
- `fix: correct alb listener rule`
- `chore: update terraform variables`

### Pull Requests

1. Target `main`.
2. Complete `.github/pull_request_template.md`.
3. Include verification commands and outcomes.
4. Keep scope minimal and focused.

## Maintainers: GitHub Repository Settings Checklist

Required status checks can only be selected after workflows exist and have run at least once.

### Phase 1 (now)

- Require pull requests before merging.
- Require at least one approval.
- Require review from Code Owners.
- Require conversation resolution.
- Restrict force pushes.
- Restrict branch deletions.

### Phase 2 (after CI workflows exist)

- Add required status checks.

## Support / Questions

Use GitHub Discussions:

- https://github.com/mneiter/aws-ecs-monorepo-foundation/discussions/new?category=q-a
