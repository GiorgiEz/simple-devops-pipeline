terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
    null = {
      source = "hashicorp/null"
    }
  }
}

provider "local" {}
provider "null" {}

# Step 1: Install Python dependencies
resource "null_resource" "install_dependencies_blue" {
  provisioner "local-exec" {
    command = "pip install -r ..\\..\\requirements.txt"
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}

# Step 2: Copy app.py to blue directory
resource "null_resource" "copy_everything_to_blue" {
  provisioner "local-exec" {
    command = "xcopy /E /Y /I ..\\..\\app ..\\..\\production\\green"
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}

# Step 3: Run blue server
resource "null_resource" "start_server_blue" {
  provisioner "local-exec" {
    command = "..\\..\\scripts\\run_server.bat blue 5000"
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}
