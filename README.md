Azure Network Terraform Module
===========

A terraform module to provide a network in Microsoft Azure.


Module Input Variables
----------------------

- `admin_username` - Windows admin username
- `admin_password` - Windows admin password
- `capacity` - desired number of instances
- `ip_config_name` - name of ip configuration (defaults to default)
- `location` - azure location
- `network_profile_name` - name of network profile (defaults to default)
- `os_disk_caching` - os disk caching requirements (defaults to ReadWrite)
- `os_disk_image` - blob uri for user disk image
- `os_disk_name` - name of os disk (defaults to default)
- `rgroup_name` - resource group name
- `scale_set_inst_size` - instance size
- `scale_set_name` - scale set name
- `scale_set_prefix` - vm name prefix for scale set
- `scale_set_tier` - scale set tier (standard or basic)
- `upgrade_policy_mode` - specifies the mode of upgrade to vms in scale set (manual or automatic)
- `vhd_containers` - virtual hard drive container location (typically storage account primary blob endpoint/storage container name)

Usage
-----

```hcl
data "terraform_remote_state" "acct" {
  backend = "azure"
  config {
    storage_account_name = "my_storage_account"
    container_name       = "my_storage_container"
    key                  = "acct.tfstate"
  }
}

data "terraform_remote_state" "network" {
  backend = "azure"
  config {
    storage_account_name = "my_storage_account"
    container_name       = "my_storage_container"
    key                  = "network.tfstate"
  }
}

data "template_file" "custom_data" {
  template = "${file("templates/custom_data.tpl")}"
}

module "compute" {
  source = "github.com/marsupermammal/tfmod-azure-compute"
  location = "eastus"
  rgroup_name = "my_resource_group"
  admin_username = "username"
  admin_password = "P@s5w0rD"
  custom_data = "${data.template_file.custom_data.rendered}"
  capacity = "3"
  os_disk_image = "https://my-storage-account.blob.core.windows.net/path/to/your/custom/image.vhd"
  os_disk_name = "my_os_disk"
  scale_set_inst_size = "Standard_A0"
  scale_set_name = "my_scale_set"
  scale_set_prefix = "my_scale_set"
  scale_set_tier = "Standard"
  upgrade_policy_mode = "Manual"
  vhd_containers = "${data.terraform_remote_state.acct.stor_acct_prim_blob_endpoint}${data.terraform_remote_state.acct.stor_cont_id}"
}
```

Author
=======

Originally created and maintained by [Phil Watts](https://github.com/)

License
=======

Apache 2 Licensed. See LICENSE for full details.
