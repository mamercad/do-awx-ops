resource "digitalocean_kubernetes_cluster" "k8s-cluster" {
  name    = var.k8s_cluster_name
  region  = var.k8s_region
  version = var.k8s_version
  node_pool {
    name       = "${var.k8s_cluster_name}-worker-pool"
    size       = var.k8s_worker_size
    node_count = var.k8s_worker_count
  }
}
resource "digitalocean_droplet" "db-droplet" {
  image    = var.db_droplet_image
  region   = var.db_droplet_region
  name     = var.db_droplet_name
  size     = var.db_droplet_size
  ssh_keys = [var.db_droplet_ssh_keys]
}

resource "local_file" "ansible-inventory" {
    filename             = "${path.module}/../ansible/environments/${var.environment}/hosts.yml"
    directory_permission = "0755"
    file_permission      = "0644"
    content = <<-EOT
      droplet:
        children:
          database:
            hosts:
              ${digitalocean_droplet.db-droplet.ipv4_address}:
            vars:
              ansible_user: root
              ansible_python_interpreter: /usr/bin/python3
      EOT
}
