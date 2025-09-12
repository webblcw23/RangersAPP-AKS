variable "subscription_id" {
  description = "The Azure subscription ID where the resources will be created."
  type        = string
  default     = "91c0fe80-4528-4bf2-9796-5d0f2a250518"
  
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
  default     = "rg-rangers-aks"
}

variable "location" {
  description = "The Azure region where the AKS cluster will be deployed."
  type        = string
  default     = "UK South"
  
}

variable "acr_name" {
  description = "The name of the Azure Container Registry (ACR) to be created."
  type        = string
  default     = "rangersacr"
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster to be created."
  type        = string
  default     = "rangers-aks-cluster"
}


