resource "digitalocean_kubernetes_cluster" "sandbox-cluster" {
  name    = var.k8s_cluster_name
  region  = var.k8s_region
  version = var.k8s_version
  node_pool {
    name       = "${var.k8s_cluster_name}-worker-pool"
    size       = var.k8s_worker_size
    node_count = var.k8s_worker_count
  }
}
