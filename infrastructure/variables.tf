variable "aws_owner_id" {
  description = "Contains the Owner Name of the the ami for ubuntu"
  type        = string
}

variable "aws_ami_name" {
  description = "Name of the ami"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnet" {
  description = "Name of the a Subnet"
  type        = string
}

variable "keypair" {
  default = "talent-academy-ec2"
}