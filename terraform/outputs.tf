output "namespace" {
  value = kubernetes_namespace.inventario.metadata[0].name
}