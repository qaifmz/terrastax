# Create Template
data "template_file" "fluentd-config" {
  template = "${file("${path.module}/fluentd-config.yaml")}"
  vars = {
    "hostname" = "prometheus"
  }
}

# Render template
resource "null_resource" "fluentd-config" {
  count = var.fluentd_enabled ? 1 : 0
  triggers = {
    manifest_sha1 = "${sha1("${data.template_file.fluentd-config.rendered}")}"
  }
  # Run Command to create services
  provisioner "local-exec" {
    command = "kubectl create -f -<<EOF\n${data.template_file.fluentd-config.rendered}\nEOF"
  }
}

# Run Command on Destroy
resource "null_resource" "destroy-fluentd-config" {
  count = var.fluentd_enabled ? 1 : 0
  provisioner "local-exec" {
    when    = "destroy"
    command = "kubectl delete -f -<<EOF\n${data.template_file.fluentd-config.rendered}\nEOF"
  }
}
