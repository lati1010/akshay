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
  description = "(Required) Tags for resources."
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
variable "remote_state_key_core" {
    description = "(Required) The remote state key where the state file will be saved to."
}
variable "remote_state_key_pattern" {
    description = "(Required) The remote state key where the state file will be saved to."
}
//**********************************************************************************************

locals {

  tags = merge(  
    {
      CL_Version   = var.cl_version
      TF_Version   = var.tf_version
      Pvdr_Version = var.pvdr_version
      RepositoryID = var.repository_id
      Github_Actor = var.github_actor
    }, var.tags)
    
}