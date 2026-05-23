resource "kubernetes_namespace" "inventario" {

  metadata {
    name = "inventario-prod"
  }

}