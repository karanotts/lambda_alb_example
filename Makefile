init:
	terraform init

validate: 
	terraform validate

apply: init validate zip
	terraform apply

clean:
	terraform destroy
	rm lambda_function_payload.zip

zip:
	zip -r lambda_function_payload lambda_list_bucket_content.py