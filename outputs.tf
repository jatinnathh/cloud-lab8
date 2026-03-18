output "nginx_service_name" {
  value = var.enable_k8s ? kubernetes_service_v1.nginx_service[0].metadata[0].name : "disabled"
}

output "mongodb_service_name" {
  value = var.enable_k8s ? kubernetes_service_v1.mongodb_service[0].metadata[0].name : "disabled"
}