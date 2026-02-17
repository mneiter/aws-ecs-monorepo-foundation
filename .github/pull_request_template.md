# PR Description

## Summary
<!-- Explain the **what** and **why** of this change. Link to ticket if applicable. -->

## Ticket / Issue Link
<!-- Link to a GitHub issue, ticket, or discussion. -->

## Type of Change
<!-- Check strictly one option -->
- [ ] 🐛 Bug fix (non-breaking change which fixes an issue)
- [ ] ✨ New feature (non-breaking change which adds functionality)
- [ ] 💥 Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] 📝 Documentation update
- [ ] ♻️  Refactor (no functional changes)
- [ ] 🏗️ Build/CI/Infra changes

## Risk Assessment
<!-- MUST BE FILLED. Select one. -->
- [ ] **Low**: Trivial UI change, doc update, or test-only change.
- [ ] **Medium**: Standard feature or bugfix. Verification needed but unlikely to break prod.
- [ ] **High**: Database schema change, core infrastructure, auth logic, or breaking API change.

## Verification Plan
<!-- Exact steps to verify this PR. If this section is empty, the PR should be rejected. -->
1. If an Nx workspace exists in this revision, run the relevant checks (examples):
   - `npm ci`
   - `npx nx run-many -t test`
2. If this is governance/docs-only:
   - Confirm README/CONTRIBUTING render correctly in GitHub
   - Confirm Issue forms load and labels apply as expected
3. Add any additional verification steps specific to this change:
   - ...

## Rollback Plan
<!-- Required for infra/behavior changes. "N/A" is acceptable with a short rationale. -->

## Screenshots / Recordings
<!-- REQUIRED for UI changes. Delete if backend/infra only. -->
