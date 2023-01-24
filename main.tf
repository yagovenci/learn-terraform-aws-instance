terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  key_name = "iac_alura"
  user_data = <<-EOF
                #!/bin/bash
                cd /home/ubuntu
                echo “<h1>Mensagem a ser mostrada</h1>” > index.js
                nohup busybox httpd -f -p 8080 &
                EOF
  tags = {
    Name = "Novoteste aws"
  }
}

