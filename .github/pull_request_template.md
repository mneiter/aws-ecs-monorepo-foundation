## Summary
What does this PR change?

## Why
Why is this change needed? What problem does it solve?

## How
High level approach and key implementation details.

## Verification
Exact commands to run locally or in CI to verify the change.

- [ ] npm ci
- [ ] nx format:check
- [ ] nx lint
- [ ] nx test
- [ ] nx build web
- [ ] nx build api
- [ ] docker build -f apps/web/Dockerfile -t web .
- [ ] docker build -f apps/api/Dockerfile -t api .
- [ ] terraform fmt -check (if infra changed)
- [ ] terraform validate (if infra changed)

## Checklist
- [ ] Scope is minimal and focused
- [ ] No secrets or credentials added
- [ ] Docs updated if needed
- [ ] Tests added or updated if behavior changed
- [ ] Verification commands listed above were executed (only check if actually run)

## Notes
Anything reviewers should pay attention to (tradeoffs, follow ups, risks).
