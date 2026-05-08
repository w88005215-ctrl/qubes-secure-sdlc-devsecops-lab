terraform {
  required_version = ">= 1.6.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "devsecops_lab_fixed" {
  name        = "devsecops-lab-fixed"
  description = "Fixed security group for Qubes Secure SDLC DevSecOps Lab"

  ingress {
    description = "Allow HTTP only from internal lab network"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  egress {
    description = "Allow outbound HTTPS for package and vulnerability metadata access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  tags = {
    Project = "qubes-secure-sdlc-devsecops-lab"
    Version = "fixed"
  }
}
