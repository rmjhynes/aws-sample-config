data "aws_caller_identity" "current" {}

resource "aws_iam_role" "sample_role" {
  name        = "sample-role"
  description = "A sample role that does nothing and is not attached to any resources."
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.id}:root"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_s3_bucket" "sample_bucket" {
  bucket        = "sample-bucket"
  force_destroy = "true"
}

resource "aws_s3_bucket_public_access_block" "sample_public_access_block" {
  bucket = aws_s3_bucket.sample_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
