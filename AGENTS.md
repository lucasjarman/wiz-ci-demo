# Agent rules for wiz-ci-demo

This public repo is a set of deliberately insecure, inert fixtures for Wiz demos. Everything risky here is intentional.

1. Do NOT fix, harden, or "clean up" the workflows, Terraform or manifests. The findings are the demo.
2. Never add a REAL secret, token or credential. The one repo secret, `ANTHROPIC_API_KEY`, holds a REVOKED Anthropic key (dead, cannot call the API) so Wiz sees a workflow with access to secrets. Keep it revoked; never replace it with a live key. No cloud credentials, nothing real. The repo is public.
3. Never run, enable, apply or install the fixtures. The workflow job is `if: false`, the Terraform is never applied, the npm package is never installed.
4. The Wiz-facing demo (project `LucasJ-Monodemo`) is managed from the private repo `lucasjarman/wiz-monodemo`.
