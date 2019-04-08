<B>Mongo DB instance creation and installation ( EC2-terraform - ansible) stage1<B>

<c>main.tf<c> --> 
       Creates EC2 instance  
       Add a security group rule to the instance security group
       Gets the Ubuntu AMI ID
<c>outputs.tf<c> -->
       Outputs the ID,IP of created EC2 instance .

<c>vars.tf<c> --->
       aws_access_key and aws_secret_key are imputed as vars.


<c>mongodb*.yaml<c> --->
    Ansible playbook to copy the config file to expose mongodb.
    Create root_user and mongo_db_user for products db.

<c>installer.sh<c> --->
    Given as user input for python and other dependencies installation..



