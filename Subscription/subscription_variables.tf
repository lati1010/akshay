// Common Variables
//**********************************************************************************************
variable "env" {
    description = "(Required) The environment where resources will be deployed into. Part of the naming scheme."
}
variable "postfix" {
    description = "(Required) A unique identifier for the deployment. Part of the naming scheme."
}
variable "location" {
    description = "(Required) The cloud region where resources will be deployed into."
}
variable "subscription_id" {
    description = "(Required) The subscription ID of the environment."
}
variable "tenant_id" {
    description = "(Required) The tenant ID of the environment."
}
variable "tags" {
    description = " (Required) Specifies the tags for resources in sub - application, environment, engagement, LOB & Owner."
    type = map(any)
    default = {}
}
variable "cl_version" {
  description = "(Required) Tags for resources."
}
variable "tf_version" {
  description = "(Required) Tags for resources."
}
variable "pvdr_version" {
  description = "(Required) Tags for resources."
}
variable "repository_id" {
  description = "(Required) Tags for resources."
}
variable "github_actor" {
  description = "(Required) Tags for resources."
}
variable "resourceid" {
   type = string
   description = "The resourceid"
   default = ""
}
variable "definitionid" {
   type = string
   description = "The definitionid"
   default = ""
}

variable "effect" {
   type = string
   description = "The effect of the policy"
   default = ""
}
variable "name" {
   type = string
   description = "The name of the policy"
   default = ""
}
variable "Audit_policies" {
    type = list(object({
        policy_name = string
        def_id = string
        }))
    default = [
    {policy_name = "test1", def_id = "/provider/microsoft.authorization/policydefinitions/123dfrfggghh"},
    {policy_name = "test2", def_id = "/provider/microsoft.authorization/policydefinitions/0123dfrfggghh"}
    ]
}
variable "Deny_policies" {
    type = list(object({
        policy_name = string
        def_id = string
        }))
    default = [
    {policy_name = "test1", def_id = "/provider/microsoft.authorization/policydefinitions/123dfrfggghh"},
    {policy_name = "test2", def_id = "/provider/microsoft.authorization/policydefinitions/0123dfrfggghh"}
    ]
}
//**********************************************************************************************
    
// TF remote state SA selected network access & PE VARS
//**********************************************************************************************
variable "cl_tfstate_core_nacl_allowed_subnets" {
    description = "(Required) The allowed subnets to be whitelisted on tf storage account."
    type = list(string)
    default = [""]
}
variable "cl_tfstate_core_allowed_pe_subnet_id" {
    description = "(Required) The allowed pe subnet ids to be leveraged for pe connection on tf storage account."
    type = string
    default = ""
}
variable "cl_tfstate_core_private_dns_zone_ids" {
    description = " (Required) Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
    type = list(string)
    default = [""]
}
variable "cl_tfstate_storage_account_enable_pe" {
    description = "Toggle to enable private endpoint connection on tf storage account"
    type = bool
    default = true
}
variable "cl_tfstate_storage_account_enable_network_rules" {
    description = "Toggle to enable selected network access on tf storage account"
    type = bool
    default = true
}
//**********************************************************************************************


// Write code here


// Calculated State File Variables
//**********************************************************************************************
variable "remote_state_rg" {
    description = "(Required) The remote state resource group name."
}
variable "remote_state_sa_name" {
    description = "(Required) The remote state storage account name."
}
variable "remote_state_container" {
    description = "(Required) The remote state container name in the storage account."
}
variable "remote_state_key_subscription" {
    description = "(Required) The remote state key where the state file will be saved to."
}
//**********************************************************************************************
    
// Local Variables
//**********************************************************************************************
locals {

  core_shared_services_us_id_map = {   
        "nprd-pr" = "79be621b-a188-406b-affb-2b0c00bc0d97"
        "prod-pr" = "79be621b-a188-406b-affb-2b0c00bc0d97"  
        "prod-dr" = "79be621b-a188-406b-affb-2b0c00bc0d97"
    }
    
  core_sharedsvcs_us_logging_rg = {
    "nprd-pr" = "testrg"
    "prod-pr" = "testrg"
    "prod-dr" = "testrg"
    }
    
  core_sharedsvcs_us_log_analytics_private_link_scope_name = {
    "nprd-pr" = ""
    "prod-pr" = ""
    "prod-dr" = ""
    }

  tags = merge(  
    {
      CL_Version   = var.cl_version
      TF_Version   = var.tf_version
      Pvdr_Version = var.pvdr_version
      RepositoryID = var.repository_id
      Github_Actor = var.github_actor
    }, var.tags)

    
  timeout_duration = "2h"
}
