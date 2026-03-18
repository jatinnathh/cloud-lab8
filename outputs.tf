output "nginx_service_name" {
  value = kubernetes_service_v1.nginx_service.metadata[0].name
}

output "mongodb_service_name" {
  value = kubernetes_service_v1.mongodb_service.metadata[0].name
}