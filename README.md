# Ansible AWX on DigitalOcean

Stands up AWX using the [AWX Operator](https://github.com/ansible/awx-operator/) on [DigitalOcean](https://www.digitalocean.com/). [Terraform](https://www.terraform.io/) brings up the infrastructure ([Kubernetes](https://kubernetes.io/) cluster and a Droplet for [PostgreSQL](https://www.postgresql.org/)) and [Ansible](https://www.ansible.com/) brings up the application. Check the `Makefile` and `example.env` :)
