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
