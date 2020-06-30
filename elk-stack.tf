# Create Template
data "template_file" "elk-stack" {
  template = "${file("${path.module}/elk-stack.yaml")}"
}

# Render template
resource "null_resource" "create-elk-stack" {
  triggers = {
    manifest_sha1 = "${sha1("${data.template_file.elk-stack.rendered}")}"
  }
  # Run Command to create services
  provisioner "local-exec" {
    command = "kubectl create -f -<<EOF\n${data.template_file.elk-stack.rendered}\nEOF"
  }
}

# Run Command on Destroy
resource "null_resource" "destroy-elk-stack" {
  provisioner "local-exec" {
    when    = "destroy"
    command = "kubectl delete -f -<<EOF\n${data.template_file.elk-stack.rendered}\nEOF"
  }
}
