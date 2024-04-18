output "instance_id" {
  value = [for v in oci_core_instance.instance : v.id]
}
