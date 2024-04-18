data "oci_secrets_secretbundle" "ssh_public_key" {
  secret_id = var.secret_id
}
