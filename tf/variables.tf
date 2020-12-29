variable "do_api_token" {
  type = string
}

variable "k8s_region" {
  type = string
}

variable "k8s_cluster_name" {
  type = string
}

variable "k8s_version" {
  type = string
}

variable "k8s_worker_size" {
  type = string
}

variable "k8s_worker_count" {
  type = number
}

variable "db_droplet_region" {
  type = string
}
variable "db_droplet_image" {
  type = string
}

variable "db_droplet_name" {
  type = string
}
variable "db_droplet_size" {
  type = string
}

variable "db_droplet_ssh_keys" {
  type = string
}
