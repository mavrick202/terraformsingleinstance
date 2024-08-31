# Terraform statefile bucket
resource "aws_s3_bucket" "terraform-state" {
  bucket = "devsecopsb42-terraform-state"
  acl    = "private"
  tags = {
    Name        = "devsecopsb42-terraform-state"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "terraform-state" {
  bucket = aws_s3_bucket.terraform-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Locking the statefile with DynamoDB
resource "aws_dynamodb_table" "terraform-state-lock" {
  name         = "devsecopsb42-terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "devsecopsb42-terraform-state-lock"
    Environment = var.environment
  }
}