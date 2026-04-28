variable "vpc_id" {
  default = "vpc-0e2fec9dcafae682b"
}

variable "public_subnet_ids" {
  default = ["subnet-0d34dd35a6b48bbb3","subnet-09f77036450e23163"]
}

variable "log_bucket_id" {
  default = "terraformassigment"
}

variable "region" {
  default = "ap-northeast-2"
}