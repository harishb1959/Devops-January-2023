resource "null_resource" "local" {
    provisioner "local-exec" {
        command = " echo \" local-exec working.. \" ; chmod 400 my_pem.pem ; echo ${var.ec2_public_ip} > conf/public_ip.txt "
      
    }
  
}