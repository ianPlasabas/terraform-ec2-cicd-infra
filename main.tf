terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.18.0"
    }
  }

  backend "s3" {
    bucket = "terraform-ec2-cicd-infra-876862731491"
    key    = "ec2/terraform.state"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "server_01" {
  ami           = "ami-03bec25d3c8e6cd26"
  instance_type = "t3.micro"

  tags = {
    Name = "server-01"
    Owner = "CE-Department"
  }
}

