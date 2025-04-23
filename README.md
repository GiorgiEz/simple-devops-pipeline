
# Local Blue-Green Deployment System

A simple local DevOps project that implements **Blue-Green deployment** using **Python Flask**, **Terraform**, and **batch scripts**. The application simulates live traffic switching between two environments (`blue` and `green`) hosted on different ports. It includes a basic CI/CD workflow, health checks, and automated provisioning using Infrastructure as Code (IaC).

---

## Table of Contents

- [Project Overview](#-project-overview)
- [Tools & Technologies](#-tools--technologies)
- [CI/CD Workflow](#️-cicd-workflow)
- [Infrastructure as Code (IaC)](#️-infrastructure-as-code-iac)

---

## Project Overview

This project demonstrates a local simulation of Blue-Green deployment. Two identical environments run Flask apps on ports `5000` (blue) and `5001` (green). Terraform manages environment provisioning, while batch scripts handle deployment commands. Pytest is used for testing the app, and a health check mechanism logs server status.

---

## Tools & Technologies

- **Python 3.12**
- **Flask 3.1**
- **Waitress WSGI Server**
- **Pytest** for unit testing
- **Terraform** for Infrastructure as Code
- **Batch scripts (.bat)** for process automation
- **Git & GitHub** for version control and automation

---

## CI/CD Workflow

1. **Version Control**
   - `main` and `dev` branches

2. **Automated Testing**
   - `pytest` runs after provisioning to validate the app

3. **Deployment Scripts**
   - Terraform copies code, installs dependencies, starts servers
   - `run_server.bat` launches the Flask server on the assigned port
   - `health_check.bat` logs server status in `health_log.txt`

4. **Manual Traffic Switching**
   - Run scripts manually to switch active traffic port (`blue` ↔ `green`)

---

## Infrastructure as Code (IaC)

- **Terraform** manages the local deployment pipeline:
  - Installs app dependencies
  - Copies code to blue/green environments
  - Starts the server on specific ports

Terraform `null_resource` with `local-exec` handles scripting for:
- Dependency installation
- App directory setup
- Launching servers

---
