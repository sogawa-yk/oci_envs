module "logging" {
  source                            = "../modules/logging/live"
  compartment_id                    = var.compartment_ocid
  read_log_display_name             = "read_log_test"
  write_log_display_name            = "write_log_test"
  log_configuration_source_resource = module.objectstorage_test.bucket_name
  log_group_display_name            = "log_group_test"
}
