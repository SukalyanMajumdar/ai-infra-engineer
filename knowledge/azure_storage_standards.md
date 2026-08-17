# Azure Storage Standards

## Security

Production storage accounts must:

- Use TLS 1.2 or newer.
- Disable public network access unless explicitly required.
- Prefer private connectivity for production workloads.
- Use the existing storage module when one exists.

## Naming

Storage account names must be globally unique and use lowercase alphanumeric characters.

## Changes

Do not replace an existing storage account when a configuration change can be made in place.
