output "server_1_id" {
  value = aws_instance.ec2_server_1.id
}

output "server_2_id" {
  value = aws_instance.ec2_server_2.id
}

output "server_1_private_ip" {
  value = aws_instance.ec2_server_1.private_ip
}

output "server_2_private_ip" {
  value = aws_instance.ec2_server_2.private_ip
}