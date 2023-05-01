
resource "kubernetes_secret" "registry-secret" {
  metadata {
    name = "registry-secret"
  }

  data = {
    mvatandoost = "${var.image_pull_secret}"
  }

  type = "Opaque"
}

