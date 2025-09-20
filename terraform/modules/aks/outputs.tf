# Output the kube_config for the AKS cluster
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}

# This output makes the cluster's ID available.
output "kubernetes_cluster_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id
}

# Output for ACR
output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "kubelet_identity_object_id" {
  value = data.azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
}

output "azurerm_aks_cluster" {
  value = azurerm_kubernetes_cluster.aks_cluster
}

output "aks_principal_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
}
output "aks_subnet_id" {
  value = var.aks_subnet_id
}