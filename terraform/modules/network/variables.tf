# All Network Module Variables

variable "vnet_name" {}

variable "subnet_name" {}

variable "nsg_name" {}

variable "address_space" {
  type = list(string)
}

variable "subnet_prefixes" {
  type = list(string)
}

variable "location" {}

variable "resource_group_name" {}
