resource "aws_instance" "test" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]

  tags = {
    Name = "terraform"
    Project = "roboshop"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id
    egress {
        description      = "allow TLS inbound traffic"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }
    ingress {
        description      = "allow TLS inbound traffic"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls_terraform"
    Project = "roboshop"
  }
}