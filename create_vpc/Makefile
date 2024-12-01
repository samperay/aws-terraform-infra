fmt:
	terraform fmt
	@echo "formatted tf files"


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
	@echo "tf files cleanup"

