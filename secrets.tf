resource "null_resource" "k8s-managed" {
  triggers = {
    timestamp = timestamp()
  }

  provisioner "local-exec" {
    when    = create
    command = " ./k8s.sh"
    environment = {
      prep_k8s_file = templatefile("${path.module}/.templates/secrets.tmpl", {
        mvatandoost-dockerhub              = base64encode("${var.image_pull_secret}")
      })
      MANIFEST_FILE = "./k8s/secrets.yaml"
    #   LOCATION      = module.tag.tags["location"]
    #   ENVIRONMENT   = module.tag.tags["environment"]
      NAMESPACE     = "default"
    }
  }
}
