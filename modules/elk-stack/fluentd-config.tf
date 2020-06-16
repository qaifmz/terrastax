data "template_file" "fluentd-config" {
  template = "${file("${path.module}/fluentd-config.yaml")}"
  vars = {
    "hostname" = "prometheus"
  }
}

resource "null_resource" "fluentd-config" {
  triggers = {
    manifest_sha1 = "${sha1("${data.template_file.fluentd-config.rendered}")}"
  }

  provisioner "local-exec" {
    command = "kubectl create -f -<<EOF\n${data.template_file.fluentd-config.rendered}\nEOF"
  }
}

resource "null_resource" "destroy-fluentd-config" {
  provisioner "local-exec" {
     when = "destroy"
     command = "kubectl delete -f -<<EOF\n${data.template_file.fluentd-config.rendered}\nEOF"
    }
}
