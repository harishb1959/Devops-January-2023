resource "aws_s3_bucket" "hbuser-654005309267-s3-tf" {
  bucket = var.s3_bucket_name
  
  tags = {
    Name = "terraform-bucket"
  }
}