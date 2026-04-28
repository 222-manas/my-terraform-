terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
}

provider "aws" {
  region = var.region
}
resource "aws_security_group" "ec2_sg" {
  name   = "ec2-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_server_1" {
  ami  = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_1_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "Server 1" > /var/www/html/index.html
    EOF

  tags = {
    Name = "ec2-server-1"
  }
}

resource "aws_instance" "ec2_server_2" {
  ami = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_2_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
   #!/bin/bash
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "Server 2" > /var/www/html/index.html
     EOF

  tags = {
    Name = "ec2-server-2"
  }
}