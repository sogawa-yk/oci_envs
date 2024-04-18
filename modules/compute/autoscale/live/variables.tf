### COMMON ##############################################
variable "compartment_id" {}
variable "availability_domain" {}
variable "subnet_id" {}

### INSTANCE_CONFIGURATION ##############################
variable "metadata" {}
variable "shape" {}
variable "instance_configuration_display_name" {}
variable "image_id" {}
variable "instance_configuration_instance_details_launch_details_agent_config_are_all_plugins_disabled" {}
variable "instance_configuration_instance_details_launch_details_agent_config_is_management_disabled" {}
variable "instance_configuration_instance_details_launch_details_agent_config_is_monitoring_disabled" {}
variable "instance_configuration_instance_details_launch_details_agent_config_plugins_configs" {}

### INSTANCE_POOL #######################################
variable "instance_pool_display_name" {}
variable "instance_pool_display_name_formatter" {}
variable "backend_set_name" {}
variable "load_balancer_id" {}
variable "load_balancer_enabled" {}

### AUTOSCALING CONFIGURATION ###########################
variable "autoscaling_configuration_display_name" {}
