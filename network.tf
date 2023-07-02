resource "aws_vpc" "task_5a_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Task 5A VPC"
  }
}

resource "aws_subnet" "pub1" {
  vpc_id     = aws_vpc.task_5a_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.availability_zone_a

  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "pub2" {
  vpc_id     = aws_vpc.task_5a_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = var.availability_zone_b

  tags = {
    Name = "Public Subnet 2"
  }
}

output "aws_vpc" {
  value = aws_vpc.task_5a_vpc.id
}

output "aws_subnet" {
  value = aws_subnet.pub1.id
}

resource "aws_internet_gateway" "task_5a_igw" {
  vpc_id = aws_vpc.task_5a_vpc.id

  tags = {
    Name = "Task 5A IGW"
  }
}

resource "aws_route_table" "route1" {
  vpc_id = aws_vpc.task_5a_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.task_5a_igw.id
  }
}

resource "aws_route_table_association" "sub_route" {
  subnet_id      = aws_subnet.pub1.id
  route_table_id = aws_route_table.route1.id
}