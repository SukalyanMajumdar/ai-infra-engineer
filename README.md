# Terraform Azure Infrastructure

Three-layer Terraform codebase for Azure:

```
terraform-azure-infra/
├── modules/            # Reusable, for_each-driven building blocks
│   ├── resource_group/
│   ├── storage_account/
│   ├── vnet/
│   ├── subnet/
│   ├── nsg/             # NSG + subnet<->NSG association
│   └── nsg_rule/
├── inputs/              # Environment data (no logic)
│   ├── core.tfvars      # Values shared by every environment (subscription_id, tags)
│   └── dev.tfvars        # dev-specific resource maps
└── caller/               # Root module: wires modules + inputs together
    ├── provider.tf
    ├── backend.tf
    ├── backend.hcl.example
    ├── variables.tf
    ├── locals.tf
    ├── main.tf
    └── outputs.tf
```

## Design

- **Every module takes a `map(object({...}))` and uses `for_each`**, so each
  module can create any number of instances of that resource type (e.g.
  two resource groups, three storage accounts) in one call.
- **Caller-level maps reference each other by logical key**, not by hardcoded
  Azure resource names/IDs (e.g. a subnet declares `vnet_key = "main"`
  rather than a literal vnet name). `caller/locals.tf` resolves those keys
  into real values using the outputs of upstream modules
  (`module.resource_group.resource_group_names[...]`, etc.), so `inputs/*.tfvars`
  stays pure data with no `module.*` references.
- **`subscription_id` is a variable**, supplied via `core.tfvars`, and used by
  `provider.tf` — nothing is hardcoded in the provider block.
- **Remote state** uses the `azurerm` backend with a partial configuration
  (`caller/backend.tf`) so the same code initializes against different
  state stores per environment without editing committed files.

## Usage

```bash
cd caller

# 1. Configure the backend (copy the example, fill in real values, keep it out of VCS)
cp backend.hcl.example backend.hcl
terraform init -backend-config=backend.hcl

# 2. Plan / apply, layering the shared + environment tfvars
terraform plan  -var-file=../inputs/core.tfvars -var-file=../inputs/dev.tfvars
terraform apply -var-file=../inputs/core.tfvars -var-file=../inputs/dev.tfvars
```

For a new environment (e.g. staging), add `inputs/staging.tfvars` following
the same shape as `dev.tfvars` and swap it in on the command line — no
changes needed in `modules/` or `caller/`.

## Adding another resource of an existing type

Add another entry to the relevant map in the environment's `.tfvars` file
(e.g. another key under `storage_accounts`). The module's `for_each` picks
it up automatically — no module code changes required.

## Requirements

- Terraform >= 1.5.0
- `hashicorp/azurerm` provider ~> 4.0
- Azure credentials available to the provider (e.g. `az login`, a service
  principal via environment variables, or OIDC/managed identity in CI —
  this codebase relies on the default `azurerm` provider auth chain and
  only pins `subscription_id` explicitly).
