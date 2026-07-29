resource "aws_instance" "sample" {
  # if envionment is dev the instance type is t3.micro else t3.small
  ami           = var.ami_id
  instance_type = var.environment == "dev" ? var.instance_type : "t3.small"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]

  tags = var.ec2_tags
}

resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = var.sg_description
  #vpc_id      = aws_vpc.main.id
    egress {
        description      = "allow TLS inbound traffic"
        from_port        = var.sg_from_port
        to_port          = var.sg_to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
  }
    ingress {
        description      = "allow TLS inbound traffic"
        from_port        = var.sg_from_port
        to_port          = var.sg_to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}