resource "aws_instance" "first-server" {
  ami = "ami-0194c3e07668a7e36"
  instance_type = "t2.micro"
  key_name = aws_key_pair.id_rsa.key_name
  vpc_security_group_ids = [aws_security_group.terraform-web-server.id]
}

resource "aws_key_pair" "id_rsa" {
  key_name   = "id_rsa"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_security_group" "terraform-first-server" {
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "ip-1" {
  value = aws_instance.first-server.public_ip
}
