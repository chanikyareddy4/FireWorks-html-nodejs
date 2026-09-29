resource "kubernetes_deployment_v1" "fire_work" {
  metadata {
    name = "fire-work"

    labels = {
      app = "fire-work"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "fire-work"
      }
    }

    template {
      metadata {
        labels = {
          app = "fire-work"
        }
      }

      spec {
        container {
          name = "fire-work"

          image = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.ecr_repository_name}:${var.ecr_image_tag}"

          image_pull_policy = "Always"

          port {
            container_port = 8080
          }

          resources {
            requests = {
              cpu    = "100m"
              memory = "128Mi"
            }

            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
          }
        }
      }
    }
  }

  depends_on = [
    module.eks
  ]
}

resource "kubernetes_service_v1" "fire_work" {
  metadata {
    name = "fire-work-service"
  }

  spec {
    selector = {
      app = "fire-work"
    }

    port {
      port        = 80
      target_port = 8080
      protocol    = "TCP"
    }

    type = "LoadBalancer"
  }

  depends_on = [
    kubernetes_deployment_v1.fire_work
  ]
}