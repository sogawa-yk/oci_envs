resource "oci_objectstorage_bucket" "test_bucket" {
  #Required
  compartment_id = var.compartment_ocid
  name           = "test"
  namespace      = var.bucket_namespace
}

module "logging" {
  source                            = "../live"
  compartment_id                    = var.compartment_ocid
  read_log_display_name             = "read_log_test"
  write_log_display_name            = "write_log_test"
  log_configuration_source_resource = oci_objectstorage_bucket.test_bucket.name
  log_group_display_name            = "log_group_test"
}
