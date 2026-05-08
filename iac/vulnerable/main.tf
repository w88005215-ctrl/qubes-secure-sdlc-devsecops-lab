# INTENTIONALLY VULNERABLE Terraform example for IaC scanning.
# This file is not intended for real deployment.

terraform {
  required_version = ">= 1.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "vulnerable_lab_sg" {
  name        = "vulnerable-lab-sg"
  description = "Intentionally vulnerable security group for DevSecOps lab"

  ingress {
    description = "INTENTIONALLY OPEN SSH FOR LAB SCANNING"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "INTENTIONALLY OPEN HTTP FOR LAB SCANNING"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Open egress for lab demonstration"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "qubes-secure-sdlc-devsecops-lab"
    Purpose = "intentionally-vulnerable-iac"
  }
}
