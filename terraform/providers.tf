terraform {
  required_version = ">= 1.0"
  required_providers {
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "~> 0.5.4"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "minikube" {
  kubernetes_version = "v1.30.2"
}

provider "kubernetes" {
  host                   = minikube_cluster.minikube_docker.host
  client_certificate     = base64decode(minikube_cluster.minikube_docker.client_certificate)
  client_key             = base64decode(minikube_cluster.minikube_docker.client_key)
  cluster_ca_certificate = base64decode(minikube_cluster.minikube_docker.cluster_ca_certificate)
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}