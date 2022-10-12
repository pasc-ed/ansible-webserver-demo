resource "aws_instance" "web_server" {
  count = 3

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"

  vpc_security_group_ids = [aws_security_group.web_server.id]
  key_name               = var.keypair
  subnet_id              = data.aws_subnet.public.id

  tags = {
    Name = "web-server-${count.index + 1}"
  }
}

resource "aws_security_group" "web_server" {
  name        = "ansible-web-server"
  description = "Allow connection for app inbound traffic"
  vpc_id      = data.aws_vpc.talent_academy.id

  ingress {
    description = "Allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 22 ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ansible-web-server"
  }
}