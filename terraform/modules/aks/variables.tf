# All AKS Cluster Variables

variable "aks_cluster_name" {}

variable "location" {}

variable "resource_group_name" {}

variable "dns_prefix" {}

variable "node_pool_name" {
  default = "prodpool"
}

variable "node_count" {
  default = 2
}

variable "vm_size" {
  default = "Standard_B2s"
}

variable "aks_subnet_id" {}

# ACR Variable
variable "acr_name" {}

