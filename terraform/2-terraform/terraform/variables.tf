variable "aws_instance_type" {
  default = "t3.micro"
  type    = string
}

variable "aws_root_storage_size_default" {
  default = 10
  type    = number
}
variable "ec2_ami_id" {
  default = "ami-087d1c9a513324697"
  type    = string
}

variable "env" {
  default = "dev"
  type    = string
}