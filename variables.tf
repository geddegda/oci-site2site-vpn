variable "compartment_ocid" {
  type = string
  description = "The OCID of the compartment where the VCN will be created."
}

variable "vcn0_name" {
  type = string
  description = "The name of the VCN to be created."
}

variable "vcn0_cidr_blocks" {
  type = list(string)
  description = "The CIDR blocks to be created for the VCN."
}

variable "subnet0_name" {
  type = string
  description = "The CIDR blocks to be created for the public Subnet."
}

variable "subnet0_cidr_block" {
  type = string
  description = "The CIDR blocks to be created for the public Subnet."
}

variable "subnet1_name" {
  type = string
  description = "The CIDR blocks to be created for the private Subnet."
}

variable "subnet1_cidr_block" {
  type = string
  description = "The CIDR blocks to be created for the private Subnet."
}

variable "vm_display_name" {
  type = string
  description = "VM Display Name"
}

variable "shape" {
  type = string
  description = "Select the shape you'd like for the VM"
}

variable "cpe_ip_address" {
  type = string
  description = "CPE Ip Adress"
}