resource "aws_instance" "ec2_tf" {
    ami           = var.ami_id
    instance_type = var.ec2_type
    key_name = var.ec2_pem
    vpc_security_group_ids = [var.seq_grp_id]
    tags = {
    Name = "tf-instance1"
  }
    ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 8
    volume_type = "gp2"
  }
}