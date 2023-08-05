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
TF_VAR_env="@@TF_VAR_env@@"
TF_VAR_postfix="@@TF_VAR_postfix@@"
#**********************************************************************************************


# Required Azure Variables
#**********************************************************************************************
TF_VAR_location="@@TF_VAR_location@@"
TF_VAR_subscription_id="@@TF_VAR_subscription_id@@"
TF_VAR_tenant_id="@@TF_VAR_tenant_id@@"
#**********************************************************************************************


set +a #Disables the 'set -a' command
