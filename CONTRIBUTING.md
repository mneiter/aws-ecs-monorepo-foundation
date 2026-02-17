# Contributing to aws-ecs-monorepo-foundation

This guide outlines the standards and workflows for contributing to this production-oriented foundation repository.

## 🚀 Quick Start (Running Locally)

1.  **Install Prerequisites**:
    *   Node.js (LTS)
    *   Docker Desktop
    *   Terraform CLI

2.  **Install Dependencies**:
    If/when this repository includes an Nx workspace (`package.json`, `nx.json`), install dependencies with:
    ```bash
    npm ci
    ```

3.  **Run Applications**:
    If/when this repository includes runnable apps, you can start them with:
    ```bash
    npx nx serve web  # Frontend
    npx nx serve api  # Backend
    ```

## 🔒 Security & Secrets Policy

*   **NO SECRETS IN GIT**. Never commit `.env` files or hardcoded credentials.
*   **Local Development**: Use `.env.local` (git-ignored) for local secrets.
*   **Production**: Secrets must be injected via AWS Secrets Manager or SSM Parameter Store at runtime.
*   **Detection**: Pre-commit hooks (if configured) or CI will fail if secrets are detected.

## 🛠 Standards

### Branching Strategy
*   `feat/<scope>`: New features (e.g., `feat/auth-module`)
*   `fix/<issue>`: Bug fixes (e.g., `fix/login-error`)
*   `chore/<task>`: Maintenance (e.g., `chore/dependency-update`)
*   `docs/<topic>`: Documentation updates

### Commit Messages
Follow [Conventional Commits](https://www.conventionalcommits.org/):
*   `feat: add user login`
*   `fix: resolve race condition in api`
*   `chore: update nx to 18`

### Versioning
*   **Libraries**: Semantic Versioning (SemVer) `v1.0.0`.
*   **Applications**: Incrementing tags based on deployment `app-v1.0.0`.
*   **Docker Images**: Tagged with Git SHA commit hash + SemVer tag if applicable.

### Terraform
*   **Naming**: `resource_type.snake_case_name` (e.g., `aws_s3_bucket.app_logs`).
*   **State**: Remote state in S3 + DynamoDB locking (do not use local state).
*   **Tagging**: All resources must have `Project`, `Environment`, and `Owner` tags.

### Pull Requests
1.  Target `main` branch.
2.  Fill out the **Pull Request Template** completely.
3.  Self-review your code before requesting review.
4.  Ensure all CI checks pass.

## 🧰 Maintainers: GitHub Repository Settings Checklist

Note: required status checks can only be selected after workflows exist and have run at least once.

### Phase 1 (now)
* Require a pull request before merging
* Require approvals (recommended: at least 1)
* Require review from Code Owners
* Require conversation resolution before merging
* Restrict force pushes
* Restrict branch deletions

### Phase 2 (later, once CI exists)
* Add required status checks after CI workflows are added and have run at least once

## ❓ Support / Questions

Use GitHub Discussions for questions and support:

* https://github.com/mneiter/aws-ecs-monorepo-foundation/discussions/new?category=q-a
