TF_DIR := .

.PHONY: init plan apply destroy fmt
init:
	terraform -chdir=$(TF_DIR) init

plan:
	terraform plan -var-file=$(PWD)/envs/homelab/terraform.tfvars

apply:
	terraform apply -auto-approve -var-file=$(PWD)/envs/homelab/terraform.tfvars

destroy:
	terraform destroy -auto-approve -var-file=$(PWD)/envs/homelab/terraform.tfvars

fmt:
	terraform -chdir=$(TF_DIR) fmt -recursive