terraform {
  required_providers {
    aws = {
        version = "~> 2.0"
      source = "hashicorp/aws"
    }
  }
}
variable "aws_default_region" {
  type        = string
  default     = "us-west-2"
}


provider "aws" {
  alias   = "oidc"
  region  = var.aws_default_region
  assume_role {
    role_arn = "arn:aws:iam::011974343726:role/gitlap-ec2"
    principal_arn = "arn:aws:iam::011974343726:oidc-provider/gitlab.com"
  }
}

resource "aws_instance" "my-instance" {
 
  ami           = "ami-0ceecbb0f30a902a6"
  instance_type = "t2.micro"
  key_name      = "ec2-rojeeme"
  tags = {
    Name      = "My instance"
  }
}
