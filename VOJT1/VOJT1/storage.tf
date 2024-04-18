module "objectstorage_test" {
  source           = "../modules/object_storage/live"
  compartment_id   = var.compartment_ocid
  bucket_name      = "test_bucket"
  bucket_namespace = var.bucket_namespace
}
