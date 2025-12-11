provider "aws" {
  region = "eu-north-1"
}

module "network" {
  source = "./modules/network"
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.network.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  ami               = "ami-02b7ec3147742940e"  # ✅ Your chosen Ubuntu AMI
  instance_type     = "t3.micro"
  key_name          = "folat"     # 🔁 Replace this with your actual EC2 key pair
  subnet_id         = module.network.subnet_id
  security_group_id = module.security_group.security_group_id
}
