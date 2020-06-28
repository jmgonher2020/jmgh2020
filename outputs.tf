output "Servicio_ip" {
  value = "${kubernetes_service.echo.load_balancer_ingress.0.ip}"
}
output "Puerto" {
  value = "${kubernetes_service.echo.spec.4.port.4}"
}  
output "Replicas" {
  value = "${kubernetes_deployment.echo.spec.0.replicas}"
}
output "Nodos" {
  value = "${oci_containerengine_node_pool.k8s_node_pool.node_config_details.0.size}"
}
output "K8s_Version" {
  value = "${oci_containerengine_cluster.k8s_cluster.kubernetes_version}"
}
output "Nodo_shape" {
  value = "${oci_containerengine_node_pool.k8s_node_pool.node_shape}"
}
