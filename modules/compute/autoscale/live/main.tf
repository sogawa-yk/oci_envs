resource "oci_core_instance_configuration" "test_instance_configuration" {
  ### REF ################################################
  # https://github.com/oracle/terraform-provider-oci/issues/1968
  ########################################################


  #Required
  compartment_id = var.compartment_id

  #Optional
  display_name = var.instance_configuration_display_name
  instance_details {
    #Required
    instance_type = "compute"

    #Optional
    launch_details {
      compartment_id = var.compartment_id
      source_details {
        # 以下はイメージを使用してインスタンスを起動する例
        source_type = "image"
        image_id    = var.image_id
      }
      create_vnic_details {

        #Optional
        assign_public_ip = false
        subnet_id        = var.subnet_id
      }
      # fault_domain = var.fault_domain # 指定しない場合はシステムが自動で設定する
      launch_mode = "NATIVE"
      metadata    = var.metadata
      shape       = var.shape
      # shape_config {
      # Flexシェイプの時に必要
      #   #Optional
      #   baseline_ocpu_utilization = "BASELINE_1_1"
      #   memory_in_gbs             = 16
      #   ocpus                     = 2
      # }

      #Optional
      agent_config {

        #Optional
        are_all_plugins_disabled = var.instance_configuration_instance_details_launch_details_agent_config_are_all_plugins_disabled
        is_management_disabled   = var.instance_configuration_instance_details_launch_details_agent_config_is_management_disabled
        is_monitoring_disabled   = var.instance_configuration_instance_details_launch_details_agent_config_is_monitoring_disabled

        dynamic "plugins_config" {
          for_each = var.instance_configuration_instance_details_launch_details_agent_config_plugins_configs

          content {
            name          = plugins_config.value.name
            desired_state = plugins_config.value.desired_state
          }
        }
      }
    }

  }
}


resource "oci_core_instance_pool" "test_instance_pool" {
  #Required
  compartment_id            = var.compartment_id
  instance_configuration_id = oci_core_instance_configuration.test_instance_configuration.id
  placement_configurations {
    #Required
    availability_domain = var.availability_domain
    primary_vnic_subnets {
      subnet_id = var.subnet_id
    }
  }
  size = 1

  #Optional
  display_name                    = var.instance_pool_display_name
  instance_display_name_formatter = var.instance_pool_display_name_formatter

  dynamic "load_balancers" {
    for_each = var.load_balancer_enabled ? [1] : []
    content {
      #Required
      backend_set_name = var.backend_set_name
      load_balancer_id = var.load_balancer_id
      port             = 80
      vnic_selection   = "PrimaryVnic"
    }
  }
}



resource "oci_autoscaling_auto_scaling_configuration" "test_auto_scaling_configuration" {
  #### DOCUMENT #####
  #https://docs.oracle.com/en-us/iaas/tools/oci-ansible-collection/4.39.0/collections/oracle/oci/oci_autoscaling_auto_scaling_configuration_module.html
  ###################
  #Required
  auto_scaling_resources {
    #Required
    id   = oci_core_instance_pool.test_instance_pool.id
    type = "instancePool"
  }
  compartment_id = var.compartment_id
  policies {
    #Required
    policy_type = "threshold"

    #Optional
    capacity {

      #Optional
      initial = 1
      max     = 3
      min     = 1
    }
    display_name = "test_autoscaling_policy"
    is_enabled   = true
    rules {
      # スケールアウトのルール

      #Optional
      action {

        #Optional
        type  = "CHANGE_COUNT_BY"
        value = 1
      }
      display_name = "test_autoscaling_policy_rule"
      metric {

        #Optional
        metric_type = "CPU_UTILIZATION"
        threshold {

          #Optional
          operator = "GT"
          value    = 50
        }
      }
    }
    rules {
      # スケールインのルール

      #Optional
      action {

        #Optional
        type  = "CHANGE_COUNT_BY"
        value = -1
      }
      display_name = "test_autoscaling_policy_rule"
      metric {

        #Optional
        metric_type = "CPU_UTILIZATION"
        threshold {

          #Optional
          operator = "LT"
          value    = 20
        }
      }
    }
  }

  #Optional
  display_name = var.autoscaling_configuration_display_name
  is_enabled   = true
}

