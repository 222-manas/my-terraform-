output "alb_dns_name" {
  value = module.ITSALB.alb_dns_name
}

output "vpc_id" {
  value = module.ITSVPC.vpc_id
}

output "PublicSubnetIDs" {
  value = module.ITSVPC.public_subnets
}
output "PrivateSubnetIDs" {
  value = module.ITSVPC.private_subnets
}