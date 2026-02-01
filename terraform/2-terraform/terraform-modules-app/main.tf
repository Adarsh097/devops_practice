#  dev environment configuration
module "dev-infra" {
  source            = "./infra-app"
  env               = "dev"
  bucket_name       = "infra-app-bucket-adarsh-5559-dev"
  instance_count    = 1
  ec2_instance_type = "t3.micro"
  ec2_ami_id        = "ami-087d1c9a513324697"
  hash_key_name     = "LockID"
}

module "prod-infra" {
  source            = "./infra-app"
  env               = "prod"
  bucket_name       = "infra-app-bucket-adarsh-5559-prod"
  instance_count    = 2
  ec2_instance_type = "t3.small"
  ec2_ami_id        = "ami-087d1c9a513324697"
  hash_key_name     = "LockID"
}

module "test-infra" {
  source            = "./infra-app"
  env               = "test"
  bucket_name       = "infra-app-bucket-adarsh-5559-test"
  instance_count    = 1
  ec2_instance_type = "t3.micro"
  ec2_ami_id        = "ami-087d1c9a513324697"
  hash_key_name     = "LockID"
}