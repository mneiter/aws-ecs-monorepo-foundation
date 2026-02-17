# Canonical Instructions for External Coding Assistants

This is the single source of truth for how external assistants operate in this repository.

## Repository Constraints

Stack:
Nx monorepo, Next.js, TypeScript, Node backend, Docker, Terraform, AWS ECS Fargate, GitHub Actions.
Region:
us-east-1.

General rules:
All technical text and code comments must be in English.

## Prompt Contract Template

```text
Model: <assistant name and version>
Goal: <what you want to change>
Context: <repo paths, relevant files>
Inputs: <logs, errors, file snippets>
Constraints:
  - Minimal scope, production oriented.
  - No fabricated command output.
  - No silent contract changes.
Plan:
  1) <high level steps>
Deliverables:
  - <files changed or created>
Verification:
  - <exact commands to run>
Suggested Commit Message:
  - <one line>
Assumptions:
  - <only if needed>
