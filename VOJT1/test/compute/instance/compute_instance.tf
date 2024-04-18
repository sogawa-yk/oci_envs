module "instance" {
  source         = "../../../modules/compute/instance"
  compartment_id = var.compartment_ocid
  instances      = local.updated_instances
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

data "oci_secrets_secretbundle" "ssh_public_key" {
  secret_id = var.secret_id
}

locals {
  updated_instances = {
    for key, instance in var.instances : key => {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
      fault_domain        = instance.fault_domain
      display_name        = instance.display_name
      shape               = instance.shape
      source_details      = instance.source_details
      create_vnic_details = instance.create_vnic_details
      shape_config        = instance.shape_config
      plugins_config      = instance.plugins_config
      metadata = {
        user_data = base64encode(<<-EOF
                            #cloud-config
                            package_update: true
                            package_upgrade: true
                            packages:
                                - nginx
                                - iptables-persistent

                            runcmd:
                            - iptables -I INPUT 5 -p tcp --dport 80 -j ACCEPT
                            - netfilter-persistent save
                            - systemctl start nginx
                            - systemctl enable nginx

                            EOF
        )
        ssh_authorized_keys = base64decode(data.oci_secrets_secretbundle.ssh_public_key.secret_bundle_content.0.content)
      }
    }
  }
}
