output "id" {
description="ID of mongodb instance"
value="${aws_instance.mongodb.id}"
}

output "ip" {
  description="Ip of mongodb instance"
  value="${aws_instance.mongodb.public_ip}"
}

output "id_image"{
   description="Image used"
   value="${data.aws_ami.mongo.id}"
}

output "security_group"
   {
   value="${aws_instance.mongodb.security_groups[0]}"
}
