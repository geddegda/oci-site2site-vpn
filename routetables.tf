resource "oci_core_route_table" "route_table0" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn0.id
    display_name = "rt_public_subnet"

    route_rules {
        network_entity_id = oci_core_internet_gateway.igw0.id
        destination = "0.0.0.0/0"
    }
	route_rules {
        network_entity_id = oci_core_drg.drg0.id
        destination = "192.168.0.0/24"
    }
}

resource "oci_core_route_table" "route_table1" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn0.id
    display_name = "rt_private_subnet"

    route_rules {
        network_entity_id = oci_core_nat_gateway.nat0.id
        destination = "0.0.0.0/0"
    }
	route_rules {
        network_entity_id = oci_core_drg.drg0.id
        destination = "192.168.0.0/24"
    }
}