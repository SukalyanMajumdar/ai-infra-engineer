# ---------------------------------------------------------------------------
# dev.tfvars
# Environment-specific resource definitions for "dev".
# Every block below is a map, so adding another entry deploys another
# instance of that resource type via the module's for_each.
# ---------------------------------------------------------------------------

environment = "dev"

# ---------------------------------------------------------------------------
# Resource Groups
# ---------------------------------------------------------------------------
resource_groups = {
  app = {
    name     = "rg-myapp-dev-southindia"
    location = "southindia"
    tags     = { component = "app" }
  }
  data = {
    name     = "rg-myapp-data-dev-southindia"
    location = "southindia"
    tags     = { component = "data" }
  }
}

# ---------------------------------------------------------------------------
# Virtual Networks
# ---------------------------------------------------------------------------
vnets = {
  main = {
    name               = "vnet-myapp-dev-southindia"
    resource_group_key = "app"
    location           = "southindia"
    address_space      = ["10.10.0.0/16"]
    tags               = { component = "network" }
  }
}

# ---------------------------------------------------------------------------
# Subnets
# ---------------------------------------------------------------------------
subnets = {
  app = {
    name               = "snet-app-dev"
    resource_group_key = "app"
    vnet_key           = "main"
    address_prefixes   = ["10.10.1.0/24"]
    service_endpoints  = ["Microsoft.Storage"]
  }
  data = {
    name               = "snet-data-dev"
    resource_group_key = "app"
    vnet_key           = "main"
    address_prefixes   = ["10.10.2.0/24"]
    service_endpoints  = ["Microsoft.Storage"]
  }
}

# ---------------------------------------------------------------------------
# Storage Accounts
# ---------------------------------------------------------------------------
storage_accounts = {
  appdata = {
    name                     = "stmyappdevea001"
    resource_group_key       = "data"
    location                 = "southindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags                     = { component = "data" }
  }
  diagnostics = {
    name                     = "stmyappdiagdevea001"
    resource_group_key       = "data"
    location                 = "southindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Cool"
    tags                     = { component = "diagnostics" }
  }
}

# ---------------------------------------------------------------------------
# Network Security Groups
# ---------------------------------------------------------------------------
network_security_groups = {
  app = {
    name               = "nsg-app-dev"
    resource_group_key = "app"
    location           = "southindia"
    tags               = { component = "network" }
  }
  data = {
    name               = "nsg-data-dev"
    resource_group_key = "app"
    location           = "southindia"
    tags               = { component = "network" }
  }
}

# ---------------------------------------------------------------------------
# Subnet <-> NSG associations
# ---------------------------------------------------------------------------
subnet_nsg_associations = {
  app = {
    subnet_key = "app"
    nsg_key    = "app"
  }
  data = {
    subnet_key = "data"
    nsg_key    = "data"
  }
}

# ---------------------------------------------------------------------------
# NSG Rules
# ---------------------------------------------------------------------------
nsg_rules = {
  allow_https_inbound = {
    name                       = "Allow-HTTPS-Inbound"
    nsg_key                    = "app"
    resource_group_key         = "app"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
    description                = "Allow inbound HTTPS from the internet"
  }
  deny_all_inbound = {
    name                       = "Deny-All-Inbound"
    nsg_key                    = "app"
    resource_group_key         = "app"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Explicit deny-all catch-all rule"
  }
}
