#!/bin/bash



if [ "$TERRAFORM_ACTION" = "pattern-plan" ]
then
    # Initialize Terraform
    #**********************************************************************************************
    cd ./pattern
    bash ./scripts/pattern_plan_logo.sh
    echo "Terraform init"
    /usr/bin/terraform init -no-color -upgrade=true \
        -backend-config "resource_group_name"=$TF_VAR_remote_state_rg \
        -backend-config "storage_account_name"=$TF_VAR_remote_state_sa_name \
        -backend-config "container_name"=$TF_VAR_remote_state_container \
        -backend-config "key"=$TF_VAR_remote_state_key_pattern \
        -backend-config "subscription_id"=$TF_VAR_subscription_id \
        -backend-config "tenant_id"=$TF_VAR_tenant_id
    #**********************************************************************************************


    # Terraform Pattern Plan
    #**********************************************************************************************
    echo ""
    echo "Terraform Plan - Pattern"
    /usr/bin/terraform plan -no-color -input=false -out=tfplan-pattern -var-file="pattern_config.tfvars"
    cd ..
    #**********************************************************************************************
elif [ "$TERRAFORM_ACTION" = "pattern-apply" ]
then
    # Terraform Pattern Apply
    #**********************************************************************************************
    cd ./pattern
    bash ./scripts/pattern_apply_logo.sh
    echo ""
    echo "Terraform Apply - Pattern"
    /usr/bin/terraform apply -input=false -no-color tfplan-pattern
    cd ..
    #**********************************************************************************************
fi