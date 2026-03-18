provider "kubernetes" {
  config_path = "~/.kube/config"
}



############################
# NGINX DEPLOYMENT
############################
resource "kubernetes_deployment_v1" "nginx" {
  count = var.enable_k8s ? 1 : 0

  metadata {
    name = "nginx-deployment"
    labels = {
      app = "nginx"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx-container"
          image = "nginx:latest"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

############################
# NGINX SERVICE
############################
resource "kubernetes_service_v1" "nginx_service" {
  count = var.enable_k8s ? 1 : 0

  metadata {
    name = "nginx-service"
  }

  spec {
    selector = {
      app = "nginx"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

############################
# MONGODB DEPLOYMENT
############################
resource "kubernetes_deployment_v1" "mongodb" {
  count = var.enable_k8s ? 1 : 0

  metadata {
    name = "mongodb"
    labels = {
      app = "mongodb"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mongodb"
      }
    }

    template {
      metadata {
        labels = {
          app = "mongodb"
        }
      }

      spec {
        container {
          name  = "mongodb"
          image = "mongo:latest"

          port {
            container_port = 27017
          }
        }
      }
    }
  }
}

############################
# MONGODB SERVICE
############################
resource "kubernetes_service_v1" "mongodb_service" {
  count = var.enable_k8s ? 1 : 0

  metadata {
    name = "mongodb-service"
  }

  spec {
    selector = {
      app = "mongodb"
    }

    port {
      port        = 27017
      target_port = 27017
    }

    type = "ClusterIP"
  }
}