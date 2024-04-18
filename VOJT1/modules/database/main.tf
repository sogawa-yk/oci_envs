resource "oci_database_autonomous_database" "test_autonomous_database" {
  #Required
  compartment_id = var.compartment_ocid
  db_name        = var.autonomous_database_db_name
}
