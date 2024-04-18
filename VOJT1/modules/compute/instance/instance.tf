resource "oci_core_instance" "instance" {
  for_each = var.instances

  compartment_id      = var.compartment_id
  availability_domain = each.value.availability_domain
  fault_domain        = each.value.fault_domain
  display_name        = each.value.display_name
  shape               = each.value.shape

  source_details {
    source_id   = each.value.source_details.source_id
    source_type = "image"
  }

  create_vnic_details {
    assign_public_ip = each.value.create_vnic_details.assign_public_ip
    subnet_id        = each.value.create_vnic_details.subnet_id
  }

  dynamic "shape_config" {
    #Flexシェイプの時に必要
    for_each = length(regexall("^.*Flex", each.value.shape)) > 0 ? [1] : []
    content {
      baseline_ocpu_utilization = each.value.shape_config.baseline_ocpu_utilization
      memory_in_gbs             = each.value.shape_config.memory_in_gbs
      ocpus                     = each.value.shape_config.ocpus
    }

  }

  agent_config {
    dynamic "plugins_config" {
      for_each = each.value.plugins_config

      content {
        name          = plugins_config.value.name
        desired_state = plugins_config.value.desired_state
      }
    }
  }
  metadata = {
    ssh_authorized_keys = each.value.metadata.ssh_authorized_keys
    user_data           = each.value.metadata.user_data
  }
  preserve_boot_volume = false
}
