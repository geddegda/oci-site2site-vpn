data "oci_identity_availability_domains" "ads" {
  compartment_id      = var.compartment_ocid
}

data "oci_core_images" "latest_oci_image" {
  compartment_id = var.compartment_ocid

  operating_system         = "Oracle Linux"
  operating_system_version = "8"
  shape                    = var.shape

  sort_by    = "TIMECREATED"
  sort_order = "DESC"
}

data "oci_core_ipsec_connection_tunnels" "ip_sec_connection_tunnels0" {
    ipsec_id = oci_core_ipsec.ip_sec_connection0.id
}

