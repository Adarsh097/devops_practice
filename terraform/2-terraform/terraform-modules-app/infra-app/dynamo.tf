resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "${var.env}-state-lock-table-5559-ad"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.hash_key_name


  attribute {
    name = var.hash_key_name
    type = "S"
  }



  tags = {
    Name        = "${var.env}-state-lock-table-5559-ad"
    Environment = var.env

  }
}