# EC2-Module-and-Security-Group-Module-with-Apache2-UserData

In this project, terraform will be used to create modularized configurations for Deploying an EC2 instance with a specified security group and Apacge2 installed using userdata.

## TASK 1 EC2 MODULE 

i. Create a new directory for your terraform project (e.g mkdir terraform-ec2-apache)

ii. Change into the directory (cd terraform-ec2-apapce)

![image](./img/1.dir.png)

iii. Create directories for te EC2 and security modules ( mkdir -p modules/ec2 && mkdir -p modules/security-group)

![image](./img/2.ec2-and-security-group-dir.png)

iv. Write the EC2 module configuration to create the EC2 instance 
![image](./img/3.ec2-main.tf.png)

![image](./img/4.main.tf-ec2.png)

v. Write a security group module configuration to create a security group.

![image](./img/5.sec-main.tf.png)

vi. Write a network module configuration

![image](./img/6.net-main.tf.png)

vii. Write the user data script tp install and configure the apache2 on the root directory.

``#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" | sudo tee /var/www/html/index.html
``

And make it executable

``chmod +x``

![image](./img/7.apache.png)

## MAIN TERRAFORM CONFIGURATION

Create the root main.tf to intergrate EC2 and security group modules. 

![image](./img/8..main.tf.png)

## INITIALIZE TERRAFORM

``terraform init``

![image](./img/9.terra.init.png)

``terraform plan``

![image](./img/10.terra.plan.png)

``terraform validate``

![image](./img/11.validate.png)

``terraform apply``

![image](./img/12-apply.png)

![image](./img/13.apply.png)

Access the ec2 using the public ip address and verify the apache2 is installed...

![image](./img/14.access.png)

![image](./img/15.ec2.created.png)

![image](./img/16.httpd.png)

Apache up and running

![image](./img/17.httpd-up.png)


``terraform destroy``

![image](./img/18.t-destroy.png)

