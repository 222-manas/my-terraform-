terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraformassigment"
    key            = "prod/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}

module "ITSVPC" {
  source   = "./Modules/vpc"
  region   = var.region
  vpc_cidr = var.vpc_cidr
}

module "ITSALB" {
  source            = "./Modules/alb"
  region            = var.region
  vpc_id            = module.ITSVPC.vpc_id
  public_subnet_ids = module.ITSVPC.public_subnets
}

module "ITSEC2" {
  source        = "./Modules/ec2"
  region        = var.region
  vpc_id        = module.ITSVPC.vpc_id
  ami_id        = var.ami
  instance_type = var.instance_type
  subnet_1_id   = module.ITSVPC.private_subnet_1_id
  subnet_2_id   = module.ITSVPC.private_subnet_2_id
}
