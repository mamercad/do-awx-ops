# mmercado/awx-ops

Stands up AWX using the AWX Operator on DigitalOcean's cloud. Terraform brings up the infrastructure (Kubernetes cluster) and Ansible brings up the application.

## Terraform

Place yourself in the `tf/` directory and `terraform init/plan/apply`. You'll need to set some variables in `tf/variables.tf`.

## Ansible

Once you have a cluster, just run the playbook in the `ansible/` directory like this `ansible-playbook -i localhost, -c local kubernetes.yml -v`, it'll prompt for a few variables. You'll need the `openshift` Python module.
