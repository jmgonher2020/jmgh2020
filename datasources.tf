data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.compartment_ocid}"
  #compartment_id = "ocid1.compartment.oc1..aaaaaaaauow2wnn5drbtbuaak7s2h54ok746k7r4waw3ujfgl4eh2sv73ipa"
}
data "oci_core_images" "oracle_linux_image" {
  "compartment_id           = "ocid1.compartment.oc1..aaaaaaaauow2wnn5drbtbuaak7s2h54ok746k7r4waw3ujfgl4eh2sv73ipa"
  compartment_id = "${var.compartment_ocid}"
  operating_system         = "Oracle Linux"
  operating_system_version = "7.6"
}
