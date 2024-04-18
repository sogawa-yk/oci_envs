variable "compartment_ocid" {}
variable "instances" {
  type = map(object({
    availability_domain = string
    fault_domain        = string
    display_name        = string
    shape               = string
    source_details = object({
      source_id = string
    })
    create_vnic_details = object({
      assign_public_ip = bool
      subnet_id        = string
    })
    shape_config = object({
      baseline_ocpu_utilization = string
      memory_in_gbs             = string
      ocpus                     = string
    })
    plugins_config = list(object({
      name          = string
      desired_state = string
    }))
    metadata = object({
      ssh_authorized_keys = string
      user_data           = string
    })
  }))
}
variable "secret_id" {}
