variable "resourceGroupName" {
  type = string
  description = "Name for Resource group"
}
variable "location" {
  type = string
  description = "Name for Resource group location"
}
variable "tags" {
  type = map(any)
  description = "Name for tags"
}
variable "vnetname" {
  type = string
  description = "Name for Virtual Network"
}
variable "subnet_name" {
  type = string
  description = "Name for Subnet"
}
variable "ipaddress"{
  type=string
  description = "Name for Public IP"
}
variable "nsgname" {
  type=string
  description = "Name for Network Security Group"
}