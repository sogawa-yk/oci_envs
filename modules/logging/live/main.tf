### パラメータは以下を参考
### https://github.com/oracle-terraform-modules/terraform-oci-logging/tree/main

resource "oci_logging_log" "read_bucket_log" {
  #Required
  display_name = var.read_log_display_name
  log_group_id = oci_logging_log_group.ObjectStorage_log_group.id
  log_type     = "SERVICE"
  #Optional
  configuration {
    #Required
    source {
      #Required
      category    = "read"
      resource    = var.log_configuration_source_resource
      service     = "objectstorage"
      source_type = "OCISERVICE"
    }

    #Optional
    compartment_id = var.compartment_id
  }
  is_enabled         = true
  retention_duration = 30
}

resource "oci_logging_log" "write_bucket_log" {
  #Required
  display_name = var.write_log_display_name
  log_group_id = oci_logging_log_group.ObjectStorage_log_group.id
  log_type     = "SERVICE"
  #Optional
  configuration {
    #Required
    source {
      #Required
      category    = "write"
      resource    = var.log_configuration_source_resource
      service     = "objectstorage"
      source_type = "OCISERVICE"
    }

    #Optional
    compartment_id = var.compartment_id
  }
  is_enabled         = true
  retention_duration = 30
}

resource "oci_logging_log_group" "ObjectStorage_log_group" {
  #Required
  compartment_id = var.compartment_id
  display_name   = var.log_group_display_name
}
