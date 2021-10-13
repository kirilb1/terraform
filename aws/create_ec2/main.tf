provider "aws" {
  region = "eu-west-2"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "example" {
  ami = "ami-0ad8ecac8af5fc52b"
  instance_type = "t2.micro"
}