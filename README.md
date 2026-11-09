# wiz-ci-demo

Deliberately risky, **inert** CI/CD and supply-chain fixtures used to demo Wiz Code. Nothing in this repo is a real
system, and it holds no credentials.

| Path | What it is for |
| - | - |
| `.github/workflows/claude.yml` | A realistic high-privilege Claude Code workflow on external triggers (the agent cannot run: no API key exists here) |
| `.github/workflows/ci-demo-ai-triage.yml` | A workflow with script injection, `pull_request_target`, an unpinned action, a vulnerable action and a fake token. Its job is `if: false` |
| `ci-demo/insecure-iac/` | Insecure Terraform that is never planned or applied |
| `ci-demo/supply-chain/` | A manifest listing a package Wiz flags as malicious. Never installed |

Do not fork this to build anything. Do not add secrets. The risks are the point.
