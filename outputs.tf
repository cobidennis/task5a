
output "ec2_public_ip_1" {
  value = aws_instance.task_5a_node[0].public_ip
}
