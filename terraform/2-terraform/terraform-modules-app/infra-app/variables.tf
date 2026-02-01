variable "env" {
  description = "This is the environment for the infra."
  type        = string
}

variable "bucket_name" {
  description = "This will be used as s3-bucket name."
  type        = string
}

variable "instance_count" {
  description = "Enter the count for the ec2-instances"
  type        = number
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ec2_ami_id" {
  description = "EC2 ami_id"
  type        = string
}

variable "hash_key_name" {
  description = "The hash key name for the DynamoDB table"
  type        = string
}