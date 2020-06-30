# Required by the OCI Provider
variable "tenancy_ocid" {}

variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "private_key_password" {}
variable "compartment_ocid" {}

variable "ssh_public_key_file" {
  default = "~/.ssh/id_rsa.pub"
}

variable "region" {
  default = "us-ashburn-1"
}

# Choose an Availability Domain
variable "availability_domain" {
  default = "3"
}

variable "internet_gateway_enabled" {
  default = "true"
}

variable "worker_ol_image_name" {
  default = "Oracle-Linux-7.5"
}

variable "oke" {
  type = "map"

  default = {
    name             = "oke"
    version          = "v1.15.7"
    #version          = "v1.14.8"
    shape            = "VM.Standard2.1"
#shape            = "VM.Standard.E2.2"
    nodes_per_subnet = 1
  }
}

compartment_id = "${var.compartment_ocid}"

variable "comparment_id" {
  default= "ocid1.compartment.oc1..aaaaaaaauow2wnn5drbtbuaak7s2h54ok746k7r4waw3ujfgl4eh2sv73ipa"
  }

variable "replicas" {
  default= "3"
#   default= "4"
  }

variable "nodos" {
  default= "2"
#   default= "4"
  }
  
variable "puerto" {
  default= "8080"
#   default= "80"
  }  

variable "network_cidrs" {
  type = "map"

  default = {
    vcnCIDR               = "10.0.0.0/16"
    workerSubnetAD1       = "10.0.10.0/24"
    workerSubnetAD2       = "10.0.11.0/24"
    workerSubnetAD3       = "10.0.12.0/24"
    LoadBalancerSubnetAD1 = "10.0.20.0/24"
    LoadBalancerSubnetAD2 = "10.0.21.0/24"
    LoadBalancerSubnetAD3 = "10.0.22.0/24"
  }
}
