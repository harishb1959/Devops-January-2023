output "ec2_public_ip_iddress" {
  value = aws_instance.ec2-tf.public_ip
}

output "ec2_private_ip_iddress" {
    value = aws_instance.ec2-tf.private_ip    
}