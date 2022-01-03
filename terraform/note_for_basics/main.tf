terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
  # log in AWS console and create your own access key and secret key to replace following values
  access_key = "**"
  secret_key = "**"
}

resource "aws_vpc" "my_first_vpc" {
  cidr_block = "10.0.0.0/16"

}

resource "aws_subnet" "my_first_subnet" {
  vpc_id     = aws_vpc.my_first_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_first_subnet.id
}
