resource "aws_instance" "task_5a_node" {

  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_name
  count                  = var.instance_count
  subnet_id = count.index % 2 == 0 ? aws_subnet.pub1.id : aws_subnet.pub2.id
  vpc_security_group_ids = [aws_security_group.task5a_sg.id]
  associate_public_ip_address = true
  user_data       = <<EOF
#!/bin/bash
apt update
apt install maven git openjdk-8-jdk -y
EOF
  tags            = merge(var.default_tags, {"Name" = "${join(" ", [var.default_tags.Name, count.index + 1])}"})
}