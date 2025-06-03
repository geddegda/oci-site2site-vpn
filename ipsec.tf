
#################DRG and DRG ATTACHMENT################

resource "oci_core_drg" "drg0" {
    compartment_id = var.compartment_ocid
    display_name = "drg0"

}

resource "oci_core_drg_attachment" "drg_attachment0" {
    drg_id = oci_core_drg.drg0.id
    display_name = "drg0_attach"
	
    #drg_route_table_id = oci_core_drg_route_table.test_drg_route_table.id

    network_details {
        id = oci_core_vcn.vcn0.id
        type = "VCN"

        #Optional
        #id = var.drg_attachment_network_details_id
        #route_table_id = oci_core_route_table.test_route_table.id
        #vcn_route_type = var.drg_attachment_network_details_vcn_route_type
    }
}

####################CPE###############################
resource "oci_core_cpe" "cpe0" {
    compartment_id = var.compartment_ocid
    ip_address = var.cpe_ip_address
    display_name = "cpe0"
}

####################IPSEC###############################
resource "oci_core_ipsec" "ip_sec_connection0" {
    compartment_id = var.compartment_ocid
    cpe_id = oci_core_cpe.cpe0.id
    drg_id = oci_core_drg.drg0.id
    #static_routes = "192.168.0.0/24"
	static_routes =["192.168.0.0/24"]
    display_name = "ipsec0"
    
}

resource "oci_core_ipsec_connection_tunnel_management" "ip_sec_connection_tunnel0" {
    ipsec_id = oci_core_ipsec.ip_sec_connection0.id
    tunnel_id = data.oci_core_ipsec_connection_tunnels.ip_sec_connection_tunnels0.ip_sec_connection_tunnels[0].id
    routing = "STATIC"
    display_name = "tunnel_conn0"
    ike_version = "V1"
}

resource "oci_core_ipsec_connection_tunnel_management" "ip_sec_connection_tunnel1" {
    ipsec_id = oci_core_ipsec.ip_sec_connection0.id
    tunnel_id = data.oci_core_ipsec_connection_tunnels.ip_sec_connection_tunnels0.ip_sec_connection_tunnels[1].id
    routing = "STATIC"
    display_name = "tunnel_conn1"
    ike_version = "V1"
}