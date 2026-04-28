terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.42.0"
    }  
  }
}
provider "aws" {
    region = var.region
}

resource "aws_vpc" "super_vpc" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = "super-vpc"
    }
}

resource "aws_subnet" "private_subnet_1" {
    cidr_block = var.private_subnet_1_cidr
    vpc_id = aws_vpc.super_vpc.id
    availability_zone = var.az1
    tags ={
        Name = "Private-subnet-1"
    } 
}

resource "aws_subnet" "private_subnet_2" {
    cidr_block = var.private_subnet_2_cidr
    vpc_id = aws_vpc.super_vpc.id
    availability_zone = var.az2
    tags ={
        Name = "Private-subnet-2"
    }
}

resource "aws_subnet" "public_subnet_1" {
    cidr_block = var.public_subnet_1_cidr
    vpc_id = aws_vpc.super_vpc.id
    availability_zone = var.az1
    map_public_ip_on_launch = true
    tags = {
        Name = "public-subnet-1"
    }
}  

resource "aws_subnet" "public_subnet_2" {
    cidr_block = var.public_subnet_2_cidr
    vpc_id = aws_vpc.super_vpc.id
    availability_zone = var.az2
    map_public_ip_on_launch = true
    tags = {
        Name = "public-subnet-2"
    }
}

resource "aws_internet_gateway" "whata_igw" {
    vpc_id = aws_vpc.super_vpc.id
    tags ={
        Name = "whata-igw"
    }
}


resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.super_vpc.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.whata_igw.id
    }
}

resource "aws_route_table_association" "public_subnet_1" {
    route_table_id = aws_route_table.public_rt.id
    subnet_id = aws_subnet.public_subnet_1.id
}

resource "aws_route_table_association" "public_subnet_2" {
    route_table_id = aws_route_table.public_rt.id
    subnet_id = aws_subnet.public_subnet_2.id
}

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "first-gateway-eip"   
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "first-gateway"        
  }

  depends_on = [aws_internet_gateway.whata_igw]
}
resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.super_vpc.id

    route{
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.main.id
    }

}
resource "aws_route_table_association" "private_subnet_1" {
    route_table_id = aws_route_table.private_rt.id
    subnet_id = aws_subnet.private_subnet_1.id
}

resource "aws_route_table_association" "private_subnet_2" {
    route_table_id = aws_route_table.private_rt.id
    subnet_id = aws_subnet.private_subnet_2.id
}
