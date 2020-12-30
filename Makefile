.DEFAULT_GOAL := tf-apply

.PHONY: tf-init tf-plan tf-apply kubeconfig-show kubeconfig-save ansible-droplet ansible-k8s

tf-init:
	/bin/bash -c "source ${ENVIRONMENT}.env && cd tf && terraform init"

tf-plan: tf-init
	/bin/bash -c "source ${ENVIRONMENT}.env && cd tf && terraform plan"

tf-apply: tf-init tf-plan
	/bin/bash -c "source ${ENVIRONMENT}.env && cd tf && terraform apply -auto-approve"

kubeconfig-show:
	/bin/bash -c "source ${ENVIRONMENT}.env && doctl kubernetes cluster kubeconfig show awx-${ENVIRONMENT}"

kubeconfig-save:
	/bin/bash -c "source ${ENVIRONMENT}.env && doctl kubernetes cluster kubeconfig save awx-${ENVIRONMENT}"

ansible-droplet:
	/bin/bash -c "source ${ENVIRONMENT}.env && cd ansible && ansible-playbook -i environments/${ENVIRONMENT} droplet.yml -v"

ansible-k8s:
	/bin/bash -c "source ${ENVIRONMENT}.env && cd ansible && ansible-playbook -i environments/${ENVIRONMENT} kubernetes.yml -v"
