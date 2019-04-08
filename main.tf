provider "aws" {
   access_key = "${var.aws_access_key}"
   secret_key = "${var.aws_secret_key}"
   region     = "us-east-2"
}

data "aws_ami" "mongo" {
   filter {
    name = "name"
    values = ["ubuntu18",]
}
owners=["438784481042",]
most_recent = true
}


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRiooCuiso9BVr5ugKZxpuIMXpO+Vd8a7u+yQIC0ONF7uW/ittIudvWecLB6P+caOOXJ3kGj2r2jRabKXg/vVmeuWaVE1p3REGmiGmt+kgql5d8WCeeg+yWA0xk/YKl6TINkNg/Uf6cKOHPqTu0k6K7Z4soDwpPnMnAkM6fxbRXs3YL4Dq/Je80/Rpckr4eg2CrPpC1mc8XLtJq5TdB/6NWooUjpLkZ9CspV3QJlY+9cZjeCEJyqjoO/YoIf99WRCdaLG6/cr9Hrt4PlKvUmj2xDzw/hBqsdCsUPRLCGp2NrvRoMjAqFbTMXzq8VblXhedQx9z6o0rKjKKYYL4DNjr root@C6DES018"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_security_group_rule" "mongo_db" {
    security_group_id="${data.aws_security_group.group.id}"
    type="ingress"
    protocol ="tcp"
    from_port=27017
    to_port=27017
    cidr_blocks=["0.0.0.0/0"]
}

data "aws_security_group" "group" {
        
        name="${aws_instance.mongodb.security_groups[0]}"

}

resource "aws_instance" "mongodb" {
ami = "${data.aws_ami.mongo.id}"
instance_type = "t2.micro" 
key_name="deployer-key"
depends_on=["aws_key_pair.deployer"]
tags{
   Name = "MongoDB"
    }
user_data= "${file("installer.sh")}"
}







