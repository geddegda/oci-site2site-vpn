# oci-site2site-vpn
Ready to go Site-2-site VPN connection set-up on Oracle OCI

- The terraform files are meant to be all uploaded at once in Oracle Resource Manager, so please pack them manually into a folder
- I've left my public key here for reference, you want to update that with yours and update compute.tf with your ssh_authorized_keys
- Once deployed you must go on the ipsec connection on the Oracle console and retrieve the Oracle endpoint and secret and begin your router configuration

I've used a Cisco 2921 version 15.2, you can find the configuration at router.cfg
For it to work you have to do a few simple steps:
- update the pre-shared-key address with the secret
- change the IP at Z.Z.Z.Z with the OCI endpoint
- change the IP at X.X.X.X with your IP

This set-up will deploy for you the following resources:
  oci_core_cpe
  oci_core_drg
  oci_core_drg_attachment
  oci_core_instance
  oci_core_internet_gateway
  oci_core_ipsec
  oci_core_ipsec_connection_tunnel_management
  oci_core_nat_gateway
  oci_core_route_table
  oci_core_security_list
  oci_core_subnet
  oci_core_vcn
