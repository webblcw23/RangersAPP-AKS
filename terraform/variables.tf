variable "subscription_id" {
  description = "The Azure subscription ID where the resources will be created."
  type        = string
  default     = "91c0fe80-4528-4bf2-9796-5d0f2a250518"
}

 ## Prod RG
variable "resource_group_name_prod" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
  default     = "rg-rangers-aks"
}

## Dev RG 
variable "resource_group_name_dev" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
  default     = "rg-rangers-webapp-dev"
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

variable "image_name" {
  type    = string
  default = "rangersapp"
}

variable "docker_registry_url" {
  type    = string
  default = "https://rangersacr.azurecr.io"
}

variable "image_tag" {
  type        = string
  description = "Tag of the Docker image to deploy"
  default = "latest"
}


variable "service_principal_id" {
  description = "The Client ID of the Service Principal used by the WebApp."
  type        = string
  default     = "d0d5257b-bb1a-4272-b552-98a508458f5f"
}
