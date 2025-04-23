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
resource "null_resource" "install_dependencies_green" {
  provisioner "local-exec" {
    command = "pip install -r ..\\..\\requirements.txt"
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}

# Step 2: Copy app.py to green directory
resource "null_resource" "copy_to_green" {
  provisioner "local-exec" {
    command = "xcopy /E /Y /I ..\\..\\app ..\\..\\production\\green"
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}

# Step 3: Run green server
resource "null_resource" "start_server_green" {
  provisioner "local-exec" {
    command = "..\\..\\scripts\\run_server.bat green 5001"
  }
}
