module "test_module" {
  source = "../"
  compartment_id  = var.compartment_id
  vcn_id          = "ocid1.vcn.oc1.ca-toronto-1.amaaaaaassl65iqa4bwogdr3jswhepteejebls3kyizyr4jkt4tzf25dafrq"
  security_lists  = var.security_lists
}
