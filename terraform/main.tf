locals {
  app_port = 80
}

resource "aws_security_group" "allow_ssh" {
  name        = var.seq_grp_name
  description = "Allow inbound traffic for ssh"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = local.app_port
    to_port = local.app_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0 
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow ssh,http"
  }
}

resource "aws_instance" "ec2-tf" {
  ami           = var.ami_type
  instance_type = var.ec2_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "tf-instance1"
  }

  key_name = "test104633"

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 8
    volume_type = "gp2"
  }

}

resource "aws_s3_bucket" "s3" {
  bucket = "hb-tf"
  
  tags = {
    Name = "terraform-bucket"
  }
}