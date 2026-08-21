# ---------------------------------------------------------------------------
# core.tfvars
# Values that stay constant across every environment (dev/staging/prod).
# Environment-specific resource definitions live in <env>.tfvars instead.
# Usage:
#   terraform plan -var-file=../inputs/core.tfvars -var-file=../inputs/dev.tfvars
# ---------------------------------------------------------------------------

subscription_id = "99cc4496-f588-4b74-ae76-3aca775f7797"

common_tags = {
  managed_by = "terraform"
  owner      = "platform-team"
  costcenter = "cc-1234"
}
