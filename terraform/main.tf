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
resource "null_resource" "install_dependencies" {
  provisioner "local-exec" {
    command = "pip install -r ../requirements.txt"
  }
    triggers = {
      always_run = "${timestamp()}"
    }
}

# Step 2: Copy app.py to production directory
resource "null_resource" "copy_to_production" {
  provisioner "local-exec" {
    command = "xcopy /E /Y /I ..\\app ..\\production"
  }

  depends_on = [null_resource.install_dependencies]
}

# Step 3: Run the server
resource "null_resource" "start_server" {
  provisioner "local-exec" {
    command = "..\\run_server.bat"
  }

  depends_on = [null_resource.copy_to_production]
}

