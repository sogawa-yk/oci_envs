instances = {
  instance01 = {
    fault_domain        = null
    availability_domain = null
    display_name        = "instance01"
    shape               = "VM.Standard.E4.Flex"
    source_details = {
      source_id = "ocid1.image.oc1.ca-toronto-1.aaaaaaaasxeukiy4xr43xmxm2iymurikjbow7jeiil66eu66mxbqhy3rgp5a"
    }
    create_vnic_details = {
      assign_public_ip = true
      subnet_id        = "ocid1.subnet.oc1.ca-toronto-1.aaaaaaaaymyetezk6ryonhngf7aevalhoymifmxzzygygxzrkxkm4cntxcxq"
    }
    shape_config = {
      baseline_ocpu_utilization = null
      memory_in_gbs             = "8"
      ocpus                     = "1"
    }
    plugins_config = [
      {
        desired_state = "ENABLED"
        name          = "Bastion"
      },
      {
        desired_state = "ENABLED"
        name          = "Compute Instance Monitoring"
      }
    ]
    metadata = null
  }
  instance02 = {
    fault_domain        = null
    availability_domain = null
    display_name        = "instance02"
    shape               = "VM.Standard.E4.Flex"
    source_details = {
      source_id = "ocid1.image.oc1.ca-toronto-1.aaaaaaaasxeukiy4xr43xmxm2iymurikjbow7jeiil66eu66mxbqhy3rgp5a"
    }
    create_vnic_details = {
      assign_public_ip = true
      subnet_id        = "ocid1.subnet.oc1.ca-toronto-1.aaaaaaaaymyetezk6ryonhngf7aevalhoymifmxzzygygxzrkxkm4cntxcxq"
    }
    shape_config = {
      baseline_ocpu_utilization = null
      memory_in_gbs             = "8"
      ocpus                     = "1"
    }
    plugins_config = [
      {
        desired_state = "ENABLED"
        name          = "Bastion"
      },
      {
        desired_state = "DISABLED"
        name          = "Compute Instance Monitoring"
      }
    ]
    metadata = null
  }
}
