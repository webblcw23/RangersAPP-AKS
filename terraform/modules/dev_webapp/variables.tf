variable "resource_group_name" {}

variable "location" {}

variable "image_name" {}

variable "image_tag" {}

variable "acr_login_server" {
  type        = string
  description = "ACR login server used by the Web App"
}





