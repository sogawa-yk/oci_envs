resource "oci_containerengine_cluster" "test_cluster" {
  #Required
  compartment_id     = var.compartment_id
  kubernetes_version = "v1.28.2"
  name               = "test_k8s"
  vcn_id             = var.vcn_id
}
