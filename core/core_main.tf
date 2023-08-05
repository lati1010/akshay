module "cl_tfstate_storage_account" {
  source                                          = "../dn-tads_tf-azure-component-library/components/cl_terraform_remote_state_sa"
  env                                             = var.env
  postfix                                         = var.postfix
  location                                        = var.location
  tags                                            = local.tags
  cl_tfstate_core_nacl_allowed_subnets            = var.cl_tfstate_core_nacl_allowed_subnets
  cl_tfstate_core_allowed_pe_subnet_id            = var.cl_tfstate_core_allowed_pe_subnet_id
  cl_tfstate_core_private_dns_zone_ids            = var.cl_tfstate_core_private_dns_zone_ids 
  cl_tfstate_storage_account_enable_pe            = true
  cl_tfstate_storage_account_enable_network_rules = true
  cl_tfstate_core_module_name                     = var.cl_tfstate_core_module_name # ex: module.core_us_peninsula
}
