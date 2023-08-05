#!/bin/bash


#**********************************************************************************************
# This script will create a place to store the Terraform remote state file. It will:
# - check if the resource group $TF_VAR_remote_state_rg exists
# - create the resource group if it doesn't exist
# - check if the storage account $TF_VAR_remote_state_sa_name exists in the resource group
# - create the storage account if it doesn't exist
# - check if the container $TF_VAR_remote_state_container exists in the storage account
# - create the container if it doesn't exist
#**********************************************************************************************

source ../scripts/login.sh

source ../variables.sh

source ../scripts/predefined_variables.sh

echo ""
echo "Checking if remote state resource group '$TF_VAR_remote_state_rg' exists"
echo "**********************************************************************************************"
remote_state_rg_exists=`az group exists --name=$TF_VAR_remote_state_rg`

if [ "$remote_state_rg_exists" = "true" ]
then
    echo "Remote state resource group '$TF_VAR_remote_state_rg' exists"
else
    echo "Remote state resource group '$TF_VAR_remote_state_rg' does not exist"
    echo "Creating new resource group"
    az group create --name=$TF_VAR_remote_state_rg --location=$TF_VAR_location
fi
echo "**********************************************************************************************"

echo ""
echo "Checking if storage account '$TF_VAR_remote_state_sa_name' exists in resource group '$TF_VAR_remote_state_rg'"
echo "**********************************************************************************************"
# Checks if the remote state storage account name is available
remote_state_sa_name_available=`az storage account check-name -n=$TF_VAR_remote_state_sa_name --query nameAvailable -o tsv`
if [ "$remote_state_sa_name_available" = "false" ]
then
    echo "Remote state storage account $TF_VAR_remote_state_sa_name exists in resource group $TF_VAR_remote_state_rg"
    az storage account blob-service-properties update --enable-delete-retention true --delete-retention-days 365 -n $TF_VAR_remote_state_sa_name -g $TF_VAR_remote_state_rg
    az storage account blob-service-properties update --container-retention true --container-days 7 -n $TF_VAR_remote_state_sa_name -g $TF_VAR_remote_state_rg
    key=$(az storage account keys list -g $TF_VAR_remote_state_rg -n $TF_VAR_remote_state_sa_name --query [0].value -o tsv)
    az storage logging update --log rdw --retention 7 --account-key $key --services bqt --account-name $TF_VAR_remote_state_sa_name
 
else
    echo "Remote state storage account $TF_VAR_remote_state_sa_name does not exist in resource group $TF_VAR_remote_state_rg"
    echo "Creating new storage account"
    az storage account create --name=$TF_VAR_remote_state_sa_name -g=$TF_VAR_remote_state_rg -l=$TF_VAR_location --sku="Standard_LRS" --kind="StorageV2" --require-infrastructure-encryption
    az storage account blob-service-properties update --enable-delete-retention true --delete-retention-days 365 -n $TF_VAR_remote_state_sa_name -g $TF_VAR_remote_state_rg
    az storage account blob-service-properties update --container-retention true --container-days 7 -n $TF_VAR_remote_state_sa_name -g $TF_VAR_remote_state_rg
    az storage account update --name=$TF_VAR_remote_state_sa_name --resource-group=$TF_VAR_remote_state_rg --allow-blob-public-access false
    az storage account update --name=$TF_VAR_remote_state_sa_name --resource-group=$TF_VAR_remote_state_rg --min-tls-version TLS1_2
    key=$(az storage account keys list -g $TF_VAR_remote_state_rg -n $TF_VAR_remote_state_sa_name --query [0].value -o tsv)
    az storage logging update --log rdw --retention 7 --account-key $key --services bqt --account-name $TF_VAR_remote_state_sa_name

fi
echo "**********************************************************************************************"

echo ""
echo "Checking if container '$TF_VAR_remote_state_container' exists in storage account '$TF_VAR_remote_state_sa_name'"
echo "**********************************************************************************************"
remote_state_container_exists=`az storage container exists --account-name $TF_VAR_remote_state_sa_name --name $TF_VAR_remote_state_container --query exists -o tsv 2>null`
if [ "$remote_state_container_exists" = "true" ]
then
    echo "Remote state container $TF_VAR_remote_state_container exists in storage account $TF_VAR_remote_state_sa_name"
else
    echo "Remote state container $TF_VAR_remote_state_container does not exist in storage account $TF_VAR_remote_state_sa_name"
    echo "Creating new container"
    az storage container create --account-name $TF_VAR_remote_state_sa_name --name $TF_VAR_remote_state_container
fi
echo "**********************************************************************************************"
