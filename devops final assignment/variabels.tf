variable "region" {
  type  = string
}

variable "vpc_cidr" {
  type  = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type  = list(string)
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "desired_capacity" {
    type  = number
}

variable "min_size" {
  type        = number
}

variable "max_size" {
  type        = number
}