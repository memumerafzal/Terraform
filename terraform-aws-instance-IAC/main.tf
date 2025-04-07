terraform {

  cloud {
    organization = "adnare"
    workspaces {
      name = "terraform-aws-instance-IAC"
    }
  }
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
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
