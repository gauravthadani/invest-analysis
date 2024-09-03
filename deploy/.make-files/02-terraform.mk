## Terraform:

DIR='deploy/terraform'

.PHONY: tf-init
tf-init: ## init terraform 
	@terraform -chdir=$(DIR) init

.PHONY: tf-format
tf-format: ## format terraform files
	@terraform fmt \
		-write=true \
		-recursive

.PHONY: tf-plan
tf-plan: ## Shows what a plan looks like for applying a specific resource
	@echo "$(YELLOW)$(BOLD)[INFO]   $(RESET)"; echo "Example to type for the following question: module.rds.aws_route53_record.rds-master"
	@read -p "ENV: " ENV && \
		terraform -chdir=$(DIR) plan \
			-lock=true \
			-input=true \
			-refresh=true \
			-var-file="variables/$$ENV.tfvars" \
 
