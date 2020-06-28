##resource "null_resource" "previous" {}
##resource "time_sleep" "wait_120_seconds" {
##  depends_on = [null_resource.previous]
##  create_duration = "180s"
##}
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
      args = ["-listen=:80", "-text='Hola Mundo JMGH JUNIO- UNIR 2020"]
      port {
        container_port = 80
}
}
}
}
}
##    provisioner "local-exec" {
##    command = "sleep 60"
##  }
##  depends_on = [local_file.kubeconfig,time_sleep.wait_120_seconds]
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
      port        = "${var.puerto}"
      target_port = 80
    }
    type = "LoadBalancer"
}
##    provisioner "local-exec" {
##    command = "sleep 60"
##  }
##  depends_on = [local_file.kubeconfig,time_sleep.wait_120_seconds]
}
