resource "oci_objectstorage_bucket" "bucket" {
  #Required
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.bucket_namespace
}
