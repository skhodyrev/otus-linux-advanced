# Homework 01-02

### Description:
Automated creation of NGINX VM with Terraform and Ansible within Yandex Cloud.

### Prerequisites:
- Script is running within *nix compatible OS (if not - replace path to SSH public key)
- You already have Yandex Cloud account and have valid `folder-id`, `cloud-id` 
- You have [approprietly](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#install-terraform) configured YC console
- Terraform and Ansible already installed

### Running project:
- replace values within provider.tf with your `folder-id` and `cloud-id`
- run `export YC_TOKEN=$(yc iam create-token)`
- run next command within this project folder:
  - `terraform init --upgrade` <- download and/or update required providers
  - `terraform plan` <- verify plan
  - `terraform apply --auto-approve` 
- follow the link from outputs to verify your installation
