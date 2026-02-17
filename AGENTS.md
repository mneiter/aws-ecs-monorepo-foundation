# External Coding Assistants

This repository contains a canonical documentation hub for external coding assistants (Codex, Claude, Gemini).
These are hosted AI copilots that consume prompts, produce diffs, and follow repository contracts.
They are not internal runtime agents.

## Quick Start

1) Read the canonical contract first:
   agents/canonical.md

2) Apply assistant specific adapter rules:
   agents/codex.md
   agents/claude.md
   agents/gemini.md

3) Use the prompts from the repository, keep references relative.

## Non Negotiables

1) Do not claim commands ran if they did not.
2) Keep changes minimal and scoped to the request.
3) Any behavior change requires tests, tests must fail before and pass after.
4) Do not silently change public interfaces or documented contracts.
5) If context is missing, state assumptions explicitly.

## Branch and PR Discipline

Branch naming:
feat/<short-scope>
fix/<short-scope>
chore/<short-scope>

PR description must include:
Summary
Why
Checklist

## Verification Policy

Every code change must include a Verification section listing exact commands to run.
Prefer repository scripts and Nx targets over ad hoc commands.

## Suggested Commit Message

Every assistant response must include a Suggested Commit Message.
Use conventional commits:
feat, fix, chore, docs, test, refactor
