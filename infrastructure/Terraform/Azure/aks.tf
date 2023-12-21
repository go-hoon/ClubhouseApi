data "azurerm_key_vault_secret" "kubernetes-node-pool-ssh" {
  name         = "kubernetes-node-pool-ssh"
  key_vault_id = data.azurerm_key_vault.kv.id
}

resource "azurerm_kubernetes_cluster" "aks" {
  location            = azurerm_resource_group.rg.location
  name                = "${local.application_name}-aks"
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${local.application_name}-cluster"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = local.vm_size
    node_count = local.node_count
  }

  linux_profile {
    admin_username = local.linux_admin_username

    ssh_key {
      key_data = data.azurerm_key_vault_secret.kubernetes-node-pool-ssh.value
    }
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}