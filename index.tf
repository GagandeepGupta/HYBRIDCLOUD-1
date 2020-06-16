resource "null_resource" "site"{

connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key=tls_private_key.my_key.private_key_pem
    host     = aws_instance.my_instance.public_ip
  }

provisioner "file"{

source="C:/Users/Raghav Gupta/Desktop/FUTURE READY KNOWLEDGE/Cloud/TERRAFORM/teraws/tera-test/newone/workspace/s3-bucket/index.html" 
destination="/var/www/html/index.html" 
}
}
