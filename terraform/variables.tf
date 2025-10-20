variable "cluster_name" {
  type        = string
  description = "The minikube name."
  validation {
    condition     = length(var.cluster_name) > 0
    error_message = "Cluster name cannot be empty."
  }
}

variable "argocd_name" {
  type        = string
  description = "The ArgoCD name."
  validation {
    condition     = length(var.argocd_name) > 0
    error_message = "ArgoCD name cannot be empty."
  }
}

variable "argocd_namespace" {
  type        = string
  description = "The ArgoCD namespace."
  validation {
    condition     = length(var.argocd_namespace) > 0
    error_message = "ArgoCD namespace cannot be empty."
  }
}

variable "driver" {
  type        = string
  description = "The minikube driver."
  default     = "docker"
  validation {
    condition     = contains(["docker", "virtualbox", "vmware", "hyperkit"], var.driver)
    error_message = "Driver must be one of: docker, virtualbox, vmware, hyperkit."
  }
}

variable "nodes" {
  type        = number
  description = "The number of nodes."
  default     = 1
  validation {
    condition     = var.nodes >= 1 && var.nodes <= 10
    error_message = "Number of nodes must be between 1 and 10."
  }
}

variable "cpus" {
  type        = number
  description = "The number of cpus."
  default     = 2
  validation {
    condition     = var.cpus >= 1 && var.cpus <= 16
    error_message = "Number of CPUs must be between 1 and 16."
  }
}

variable "memory" {
  type        = number
  description = "The amount of memory in MB."
  default     = 2048
  validation {
    condition     = var.memory >= 1024
    error_message = "Memory must be at least 1024 MB."
  }
}