resource "oci_core_security_list" "security_list0" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn0.id

    display_name = "securitylist0"
    egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "all"
    }

    ingress_security_rules {
        protocol = "1"
        source = "0.0.0.0/0"


        icmp_options {
            type = 3
            code = 4
        }
    }
	
	    ingress_security_rules {
        protocol = "1"
        source = "192.168.0.0/24"

    }
	
	ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"

        tcp_options {

            max = 80
            min = 80
        }
    }
	
	ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"

        tcp_options {

            max = 22
            min = 22
        }
    }
	
}