resource "oci_core_vcn" "vcn0" {
  cidr_blocks    = var.vcn0_cidr_blocks
  compartment_id = var.compartment_ocid
  display_name   = var.vcn0_name
  dns_label      = substr(lower(replace(var.vcn0_name, "/[^a-z0-9]/", "")), 0, 15)
}

#################Public subnet########################
resource "oci_core_subnet" "subnet0" {
  cidr_block     = var.subnet0_cidr_block
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn0.id
  display_name   = var.subnet0_name
  dns_label      = substr(lower(replace(var.subnet0_name, "/[^a-z0-9]/", "")), 0, 15)
  route_table_id = oci_core_route_table.route_table0.id
  security_list_ids = [
  oci_core_security_list.security_list0.id,
  oci_core_vcn.vcn0.default_security_list_id
  ]
/*
  security_list_ids = [
  "oci_core_vcn.vcn0.default_security_list_id",
  "oci_core_security_list.security_list0.id"
  ]
*/
}

#################Private subnet########################
resource "oci_core_subnet" "subnet1" {
  cidr_block     = var.subnet1_cidr_block
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn0.id
  display_name   = var.subnet1_name
  dns_label      = substr(lower(replace(var.subnet1_name, "/[^a-z0-9]/", "")), 0, 15)
  prohibit_internet_ingress = true
  route_table_id = oci_core_route_table.route_table1.id

}

resource "oci_core_internet_gateway" "igw0" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn0.id
    display_name = "igw0"
	enabled = true
}

resource "oci_core_nat_gateway" "nat0" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn0.id
    display_name = "natgw0"
}
