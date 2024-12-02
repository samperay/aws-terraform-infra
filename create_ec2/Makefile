fmt:
	terraform fmt
	@echo "formatted tf files"

init:
	@echo "terraform initiated.."
	rm -f *.tfstate
	rm -f *.terraform
	rm -f terraform.*.backup
	rm -rf .terraform
	rm -rf .terraform.lock.*
	terraform init
	


plan:
	terraform plan
	@echo "resources for creation"


apply:
	terraform apply --auto-approve -var
	@echo "applied terraform"

clean:
	rm -f *.tfstate
	rm -f *.terraform
	rm -f terraform.*.backup
	rm -rf .terraform
	rm -rf .terraform.lock.*

	@echo "tf files cleanup"

