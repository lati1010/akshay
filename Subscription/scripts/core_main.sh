#!/bin/bash



if [ "$TERRAFORM_ACTION" = "core-plan" ]
then
    # Initialize Terraform
    #**********************************************************************************************
    cd ./core
    bash ./scripts/core_plan_logo.sh
    echo "Terraform init"
    /usr/bin/terraform init -no-color -upgrade=true \
        -backend-config "resource_group_name=$TF_VAR_remote_state_rg" \
        -backend-config "storage_account_name"=$TF_VAR_remote_state_sa_name \
        -backend-config "container_name"=$TF_VAR_remote_state_container \
        -backend-config "key"=$TF_VAR_remote_state_key_core \
        -backend-config "subscription_id"=$TF_VAR_subscription_id \
        -backend-config "tenant_id"=$TF_VAR_tenant_id
    #**********************************************************************************************


    # Terraform Plan Core
    #**********************************************************************************************
    echo ""
    echo "Terraform Plan - Core"
    /usr/bin/terraform plan -no-color -input=false -out=tfplan-core -var-file="core_config.tfvars"
    cd ..
    #**********************************************************************************************
elif [ "$TERRAFORM_ACTION" = "core-apply" ]
then
    # Terraform Apply Core
    #**********************************************************************************************
    cd ./core
    bash ./scripts/core_apply_logo.sh
    echo ""
    echo "Terraform Apply - Core"
    /usr/bin/terraform apply -input=false -no-color tfplan-core
    cd ..
    #**********************************************************************************************
fi