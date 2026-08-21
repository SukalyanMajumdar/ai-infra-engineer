# Remote state is stored in an Azure Storage Account.
# This block is intentionally left partially configured (no hardcoded
# values) so the same code can be initialized against different
# environments (dev, staging, prod, ...) using a backend config file
# or CLI flags, without ever committing state-store secrets/values to
# version control alongside environment tfvars.
#
# Initialize with:
#   terraform init -backend-config=backend.hcl
#
# or explicitly:
#   terraform init \
#     -backend-config="resource_group_name=<backend-rg>" \
#     -backend-config="storage_account_name=<backend-storage-account>" \
#     -backend-config="container_name=<backend-container>" \
#     -backend-config="key=<environment>.terraform.tfstate" \
#     -backend-config="subscription_id=<backend-subscription-id>"

terraform {
  backend "azurerm" {}
}
