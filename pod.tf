resource "null_resource" "previous" {}
resource "time_sleep" "wait_120_seconds" {
  depends_on = [null_resource.previous]
  create_duration = "180s"
}
resource "kubernetes_deployment" "echo" {
  metadata {
    name = "scalable-echo-example"
    labels = {
      App = "ScalableEchoExample"
    }
  }
  spec {
    replicas = "${var.replicas}"
    selector {
      match_labels = {
        App = "ScalableEchoExample"
      }
    }
    template {
      metadata {
        labels = {
          App = "ScalableEchoExample"
        }
      }
  spec {
    container {
      image = "hashicorp/http-echo:0.2.1"
      name  = "example2"
      args = ["-listen=:80", "-text='Hola Mundo JMGH JUNIO-2020 - UNIR"]
      port {
        container_port = 80
}
}
}
}
}
  depends_on = [time_sleep.wait_120_seconds]
}

resource "kubernetes_service" "echo" {
  metadata {
    name = "echo-example"
  }
  spec {
    selector = {
      App = kubernetes_deployment.echo.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
}
  depends_on = [time_sleep.wait_120_seconds]
}
