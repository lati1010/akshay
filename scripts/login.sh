#!/bin/bash

# Initialization instructions
echo "Logging into azure..."
echo "**********************************************************************************************"
az login --service-principal -u=$ARM_CLIENT_ID -p=$ARM_CLIENT_SECRET --tenant=$TF_VAR_tenant_id
az account set -s=$TF_VAR_subscription_id
echo "**********************************************************************************************"