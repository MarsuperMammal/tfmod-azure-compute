variable "admin_username" {}
variable "admin_password" {}
variable "capacity" {}
variable "custom_data" {}
variable "enable_automatic_upgrades" {}
variable "ip_config_name" { default = "default" }
variable "location" {}
variable "network_profile_name" { default = "default" }
variable "os_disk_caching" { default = "ReadWrite" }
variable "os_disk_image" {}
variable "os_disk_name" { default = "default" }
variable "os_type" {}
variable "rgroup_name" {}
variable "scale_set_inst_size" {}
variable "scale_set_name" {}
variable "scale_set_prefix" {}
variable "scale_set_tier" {}
variable "subnet_id" {}
variable "upgrade_policy_mode" {}
variable "vhd_containers" {}