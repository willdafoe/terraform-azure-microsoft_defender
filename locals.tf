locals {
  config        = yamldecode(file("${path.module}/config/config.yml"))
  address_space = [var.address_space]
  security_rules = [
    {
      name                       = "ssh"
      priority                   = 1001
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      destination_address_prefix = "*"
      description                = "Allow SSH from trusted IP"
    },
    {
      name                       = "rdp"
      priority                   = 1004
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      destination_address_prefix = "*"
      description                = "Allow RDP from trusted IP"
    },
    {
      name                       = "winrm-http"
      priority                   = 1005
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5985"
      destination_address_prefix = "*"
      description                = "Allow WinRM from trusted IP"
    },
    {
      name                       = "winrm-https"
      priority                   = 1006
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5986"
      destination_address_prefix = "*"
      description                = "Allow WinRM from trusted IP"
    },
    {
      name                       = "windowsATA"
      priority                   = 1007
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      destination_address_prefix = "*"
      description                = "Allow Windows ATA from trusted IP"
    }
  ]
  tags = {
    app_name = "microsoft defender"
  }
}