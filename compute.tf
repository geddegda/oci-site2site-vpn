resource "oci_core_instance" "instance0" {
 
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id      = var.compartment_ocid
    shape               = var.shape
    display_name        = var.vm_display_name

    shape_config {
        memory_in_gbs = 32
        ocpus = 6
    }
	
	create_vnic_details {
        display_name = "vnic_instance0"
        subnet_id = oci_core_subnet.subnet0.id
		assign_public_ip = true
    }
	
    source_details {
        source_id = data.oci_core_images.latest_oci_image.images[0].id
        source_type = "image"
    }
	
	metadata = {
        ssh_authorized_keys = file("./ssh-key-2023-10-05.key.pub")
		user_data           = base64encode(file("./cloud-init.yaml"))
    } 
	
  preserve_boot_volume = false
}

