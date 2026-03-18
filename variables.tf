variable "namespace" {
  default = "default"
}

variable "enable_k8s" {
  description = "Enable Kubernetes resources"
  type        = bool
  default     = true
}