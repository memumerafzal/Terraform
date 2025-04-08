provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-087f352c165340ea1"  # Replace with the AMI ID used in your EC2
  instance_type = "t2.micro"              # Replace if your instance type is different

  tags = {
    Name = "ImportedEC2"
  }
}

#this command will import existing infra
# terraform import aws_instance.my_ec2 i-0a1b2c3d4e5f67890
