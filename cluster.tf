resource "oci_containerengine_cluster" "k8s_cluster" {
  #Required
  #compartment_id     = "${var.compartment_ocid}" 
  compartment_id     = "ocid1.compartment.oc1..aaaaaaaauow2wnn5drbtbuaak7s2h54ok746k7r4waw3ujfgl4eh2sv73ipa"
  kubernetes_version = "${var.oke["version"]}"
  name               = "${var.oke["name"]}"
  vcn_id             = "${oci_core_vcn.oke_vcn.id}"

  #Optional
  options {
    service_lb_subnet_ids = ["${oci_core_subnet.LoadBalancerSubnetAD1.id}", "${oci_core_subnet.LoadBalancerSubnetAD2.id}"]
  }
}

resource "oci_containerengine_node_pool" "k8s_node_pool" {
  #Required
  cluster_id         = "${oci_containerengine_cluster.k8s_cluster.id}"
  compartment_id     = "ocid1.compartment.oc1..aaaaaaaauow2wnn5drbtbuaak7s2h54ok746k7r4waw3ujfgl4eh2sv73ipa"
  kubernetes_version = "${var.oke["version"]}"
  name               = "${var.oke["name"]}"
  node_image_name    = "${var.worker_ol_image_name}"
  node_shape         = "${var.oke["shape"]}"
  node_config_details {
    placement_configs {
      availability_domain = "uyHy:US-ASHBURN-AD-1"
      subnet_id         = "${oci_core_subnet.workerSubnetAD1.id}"
      }
    placement_configs {
      availability_domain = "uyHy:US-ASHBURN-AD-2"
      subnet_id         = "${oci_core_subnet.workerSubnetAD2.id}"
      }
    placement_configs {
      availability_domain = "uyHy:US-ASHBURN-AD-3"
      subnet_id         = "${oci_core_subnet.workerSubnetAD3.id}"
      }
      size = "${var.nodos}"
    }
}

data "oci_containerengine_cluster_kube_config" "cluster_kube_config" {
  cluster_id    = "${oci_containerengine_cluster.k8s_cluster.id}"
  expiration    = 2592000
  token_version = "2.0.0"
}

resource "local_file" "kubeconfig" {
  content  = "${data.oci_containerengine_cluster_kube_config.cluster_kube_config.content}"
  filename = "/var/lib/jenkins/.kube/config"
}
