resource "null_resource" "remote" {
    connection {
      type = "ssh"
      host = var.ec2_public_ip
      user = var.ec2_user
      private_key = file(var.ec2_pem)
      agent = false
    }

    provisioner "remote-exec" {
        inline = [
          "echo 'This is remote-exec example' > remote-exec.txt",
          "sudo apt update",
          "sudo apt install jq git -y"
        ]   
    } 
}