# Homework 01-02

### Description:
Automated creation of NGINX VM with Terraform and Ansible within Yandex Cloud.

### Prerequisites:
- Script is running within *nix compatible OS (if not - replace path to SSH public key)
- You already have Yandex Cloud account and have folder-id, cloud-id and service account
- Terraform and Ansible already installed

### Running project:
- replace values within provider.tf with your folder-id and cloud-id
- run next command within this project folder:
- `terraform init`
- `terraform plan` <- verify plan
- `terraform apply --auto-approve` 
- follow the link from outputs to verify your installation

