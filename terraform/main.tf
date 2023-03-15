resource "aws_instance" "ec2-tf" {
  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  tags = {
    Name = "tf-instance"
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