resource "aws_security_group" "task5a_sg" {
  name        = "task5a_sg"
  description = "Allow SSH and HTTP inbound traffics"
  vpc_id      = aws_vpc.task_5a_vpc.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}

output "security_group" {
  value = aws_security_group.task5a_sg.name
}
