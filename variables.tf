variable "ec2_ami" {
  description = " This is a variable to manage ec2 AMI type"
  type        = string
  default     = "ami-04b1c88a6bbd48f8e"
}

variable "ec2_key_name" {
  description = " This is a variable to manage ec2 key name"
  type        = string
  default     = "DobeeP53"
}

variable "ec2_instance_type" {
  description = " This is a variable to manage ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "default_tags" {
  description = " This is a variable to manage ec2 tags"
  type        = map(any)
  default = {
    "Name"        = "Task 5A"
    "can destroy" = "yes"
  }
}

variable "instance_count" {
  description = "The number of instances to provision"
  type        = number
  default     = 2
}
variable "availability_zone_a" {
  description = "The availability zone"
  type = string
  default = "eu-west-1a"
}

variable "availability_zone_b" {
  description = "The availability zone"
  type = string
  default = "eu-west-1b"
}
