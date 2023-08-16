#!/bin/bash


set -a #Make all following local variables environment variables 


# Component Library Version
#**********************************************************************************************
CL_REPOSITORY="dn-tads_tf-azure-component-library"
echo "CL_REPOSITORY=$CL_REPOSITORY" >> $GITHUB_ENV

CL_VERSION="v1.5.3"
echo "CL_VERSION=$CL_VERSION" >> $GITHUB_ENV

PVDR_VERSION="2.99.0"
echo "PVDR_VERSION=$PVDR_VERSION" >> $GITHUB_ENV
#**********************************************************************************************

# Terraform Version
#**********************************************************************************************
TF_VERSION="1.2.4"
echo "TF_VERSION=$TF_VERSION" >> $GITHUB_ENV
#**********************************************************************************************

# Common Variables
#**********************************************************************************************
TF_VAR_env="test"
TF_VAR_postfix="tfg"
TF_VAR_random=$1
#**********************************************************************************************


# Required Azure Variables
#**********************************************************************************************
TF_VAR_location="eastus"
TF_VAR_subscription_id="79be621b-a188-406b-affb-2b0c00bc0d97"
TF_VAR_tenant_id="716e32a2-2f56-4567-a78d-e347d95858a3"
#**********************************************************************************************


set +a #Disables the 'set -a' command
