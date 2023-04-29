# resource "null_resource" "k8s-managed" {
#   triggers = {
#     timestamp = timestamp()
#   }

#   provisioner "local-exec" {
#     when    = create
#     command = " kubectl apply -f k8s/secrets.yaml"
#     environment = {
#       prep_k8s_file = templatefile("${path.module}/.templates/secrets.tmpl", {
#         mvatandoost-dockerhub              = base64encode("${var.image_pull_secret}")
#       })
#       MANIFEST_FILE = "./k8s/secrets.yaml"
#     #   LOCATION      = module.tag.tags["location"]
#     #   ENVIRONMENT   = module.tag.tags["environment"]
#       NAMESPACE     = "default"
#     }
#   }
# }

resource "kubernetes_secret" "registry-secret" {
  metadata {
    name = "registry-secret"
  }

  data = {
    mvatandoost = "${var.image_pull_secret}"
  }

  type = "Opaque"
}

