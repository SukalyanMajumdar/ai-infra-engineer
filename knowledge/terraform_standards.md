# Terraform Engineering Standards

## General

- Prefer existing modules over creating duplicate resources.
- Make the smallest possible change required by a ticket.
- Do not modify unrelated infrastructure.
- All infrastructure must be managed through Terraform.
- Terraform formatting and validation must pass before a change is proposed.

## Production Changes

- Production infrastructure must use the existing production environment.
- Production changes require human approval before apply.
- The AI agent must never execute `terraform apply` autonomously.

## Change Safety

- Inspect existing module interfaces before modifying a module.
- Review `git diff` after modifications.
- Review `terraform plan` before proposing a change.
