Mongo DB instance creation and installation ( EC2-terraform - ansible) stage1

main.tf --> 
       Creates EC2 instance  
       Add a security group rule to the instance security group
       Gets the Ubuntu AMI ID
outputs.tf -->
       Outputs the ID,IP of created EC2 instance .

vars.tf --->
       aws_access_key and aws_secret_key are imputed as vars.


mongodb*.yaml --->
    Ansible playbook to copy the config file to expose mongodb.
    Create root_user and mongo_db_user for products db.

installer.sh --->
    Given as user input for python and other dependencies installation..



