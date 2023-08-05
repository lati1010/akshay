#!/bin/bash


# Temporary Non-Enviironment Variables
#**********************************************************************************************
env_no_dash=`echo $TF_VAR_env | sed 's/-//'`
postfix_no_dash=`echo $TF_VAR_postfix | sed 's/-//'`
#**********************************************************************************************


set -a #Make all following local variables environment variables 

# Terraform state file variables
#**********************************************************************************************
TF_VAR_remote_state_rg="rg-$TF_VAR_env-$TF_VAR_postfix-tf-state"
TF_VAR_remote_state_sa_name="sa$env_no_dash$postfix_no_dash"
TF_VAR_remote_state_container="tfcontainer"
TF_VAR_remote_state_key_core="tf_state/$TF_VAR_env/$TF_VAR_postfix-core.tfstate"
TF_VAR_remote_state_key_pattern="tf_state/$TF_VAR_env/$TF_VAR_postfix-pattern.tfstate"
#**********************************************************************************************

# Variables required for Terraform to initialize and login to Azure
#**********************************************************************************************
ARM_TENANT_ID=$TF_VAR_tenant_id
ARM_SUBSCRIPTION_ID=$TF_VAR_subscription_id
#**********************************************************************************************

set +a #Disables the 'set -a' command
