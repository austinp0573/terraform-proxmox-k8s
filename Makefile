TF_DIR := .
ENV   ?= envs/homelab

.PHONY: init plan apply destroy fmt
init:
	terraform -chdir=$(TF_DIR) init

plan:
	terraform -chdir=$(TF_DIR) plan -var-file=$(ENV)/terraform.tfvars

apply:
	terraform -chdir=$(TF_DIR) apply -auto-approve -var-file=$(ENV)/terraform.tfvars

fmt:
	terraform -chdir=$(TF_DIR) fmt -recursive

destroy:
	terraform -chdir=$(TF_DIR) destroy -auto-approve -var-file=$(ENV)/terraform.tfvars