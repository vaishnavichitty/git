provider "aws" {
  region = "${var.region}"
  access_key = "AKIAQBEQUMH2KMW5GY5G"
  secret_key = "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"
}

module "myec2" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "myec2"
  instance_count         = 1
  ami                    = "ami-086850e3dda52e84a"
  instance_type          = "t2.micro"
  key_name               = "win2019rz"
  monitoring             = true
  vpc_security_group_ids = ["sg-039f212f867c020da"]
  subnet_id              = "subnet-03215710d6c428fc1"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}