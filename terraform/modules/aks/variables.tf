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
  default = "Standard_DS2_v2"
}

variable "aks_subnet_id" {}

# ACR Variable
variable "acr_name" {}

