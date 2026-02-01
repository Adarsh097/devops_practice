resource "aws_s3_bucket" "remote_s3" {
  bucket = "my-unique-remote-terraform-state-bucket-5559-ad"


  tags = {
    Name        = "RemoteTerraformStateBucket"
    Environment = "Dev"
  }
}