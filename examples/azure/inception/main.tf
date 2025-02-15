variable "name_prefix" {}
variable "resource_group_name" {}
variable "tf_state_storage_location" {}

module "inception" {
  #source = "git::https://github.com/GaloyMoney/galoy-infra.git//modules/inception/azure?ref=b276fd3"
  source = "../../../modules/inception/azure"

  name_prefix = var.name_prefix
  resource_group_name = var.resource_group_name
  tf_state_storage_location = var.tf_state_storage_location
}
