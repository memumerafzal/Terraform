terraform {
  required_providers {
    # Terraform installs providers from the Terraform Registry by default. 
    # In this example configuration, the aws provider's source is defined as hashicorp/aws,
    # which is shorthand for registry.terraform.io/hashicorp/aws
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a" #This update changes the AMI to an Ubuntu 16.04 AMI. The AWS provider knows that it cannot change the AMI of an instance after it has been created, so Terraform will destroy the old instance and create a new one.
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
