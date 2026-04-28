region = "ap-northeast-2"

vpc_cidr = "10.0.0.0/16"

public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

ami = "ami-0c003e98ceffee43e"
instance_type = "t3.micro"

desired_capacity = 2
min_size   = 1
max_size  = 4