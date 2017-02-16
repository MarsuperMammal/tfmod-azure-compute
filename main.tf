resource "azurerm_virtual_machine_scale_set" "vmss" {
  name = "${var.scale_set_name}"
  location = "${var.location}"
  resource_group_name = "${var.rgroup_name}"
  upgrade_policy_mode = "${var.upgrade_policy_mode}"

  sku {
    name = "${var.scale_set_inst_size}"
    tier = "${var.scale_set_tier}"
    capacity = "${var.capacity}"
  }

  os_profile {
    computer_name_prefix = "${var.scale_set_prefix}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
    custom_data = "${var.custom_data}"
  }

  network_profile {
    name = "${var.network_profile_name}"
    primary = true
    ip_configuration {
       name = "${var.ip_config_name}"
       subnet_id = "${var.subnet_id}"
    }
  }

  storage_profile_os_disk {
    name = "${var.os_disk_name}"
    vhd_containers = "${var.vhd_containers}"
    create_option = "FromImage"
    caching = "${var.os_disk_caching}"
    image = "${var.os_disk_image}"
    os_type = "${var.os_type}"
  }
}
