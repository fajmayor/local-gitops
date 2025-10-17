resource "minikube_cluster" "minikube_docker" {
  driver              = var.driver
  cluster_name        = var.cluster_name
  nodes               = var.nodes
  cpus                = var.cpus
  memory              = var.memory
  preload             = true
  cache_images        = true
  auto_update_drivers = true
  install_addons      = true
  addons = [
    "default-storageclass",
    "storage-provisioner",
    "dashboard", 
    "ingress"
  ]
}

