terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

provider "null" {}

# step 1: stop the green server on port 5000
resource "null_resource" "stop_green" {
  provisioner "local-exec" {
    command = "..\\..\\scripts\\stop_server.bat green 5000"
  }

  triggers = {
    always_run = timestamp()
  }
}

# step 2: start the blue server on port 5000
resource "null_resource" "start_blue" {
  provisioner "local-exec" {
    command = "..\\..\\scripts\\run_server.bat blue 5000"
  }

  depends_on = [null_resource.stop_green]

  triggers = {
    always_run = timestamp()
  }
}