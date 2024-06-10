resource "aws_s3_bucket" "bucket" {
  bucket = local.log_bucket_name
  # acl           = "public-read"
  force_destroy = true

  # cors_rule {
  #   allowed_headers = ["*"]
  #   allowed_methods = ["PUT","POST"]
  #   allowed_origins = ["*"]
  #   expose_headers = ["ETag"]
  #   max_age_seconds = 3000
  # }

  #   policy = <<EOF
  # {
  #     "Version": "2012-10-17",
  #     "Statement": [
  #         {
  #             "Sid": "PublicReadGetObject",
  #             "Effect": "Allow",
  #             "Principal": "*",
  #             "Action": "s3:GetObject",
  #             "Resource": "arn:aws:s3:::web-gi-production-prova-vue/*"
  #         }
  #     ]
  # }
  # EOF

  # website {
  #   index_document = "index.html"
  #   error_document = "error.html"
  # }

  tags = {
    Name        = local.log_bucket_name
    Project     = var.project
    Environment = var.environment
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }

  # routing_rule {
  #   condition {
  #     key_prefix_equals = "docs/"
  #   }
  #   redirect {
  #     replace_key_prefix_with = "documents/"
  #   }
  # }
}
