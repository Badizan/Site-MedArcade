locals {
  name            = "${var.prefix}-${var.environment}-medarcade"
  log_bucket_name = "${var.prefix}-${var.environment}-medarcade"
  prefix          = "${var.prefix}-${var.environment}"
  hosts_project   = ["medarcade.grupointegrado.br"]
}

data "aws_route53_zone" "selected" {
  name = "grupointegrado.br"
}

resource "aws_route53_record" "record" {
  count   = length(local.hosts_project)
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = local.hosts_project[count.index]
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.cf.domain_name
    zone_id                = aws_cloudfront_distribution.cf.hosted_zone_id
    evaluate_target_health = true
  }
}

data "aws_acm_certificate" "grupointegrado" {
  domain      = "*.grupointegrado.br"
  statuses    = ["ISSUED"]
  most_recent = true
}

data "aws_wafv2_web_acl" "waf_cloudfront" {
  name  = "web-gi-production-cloudfront"
  scope = "CLOUDFRONT"
}

# data "aws_cloudfront_function" "redirect_faculade" {
#   name  = "redirect_faculade"
#   stage = "LIVE"
# }

# data "aws_s3_bucket" "bucket" {
#   bucket = "web-gi-production-faculdade"
# }

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "access-identity-${local.name}"
}

data "aws_iam_policy_document" "s3_policy_cf_bucket" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn}"]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.bucket.id}"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn}"]
    }
  }
  depends_on = [aws_cloudfront_origin_access_identity.origin_access_identity]
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.s3_policy_cf_bucket.json
}

# resource "aws_s3_bucket" "bucket" {
#   bucket = aws_s3_bucket.bucket.id
#   acl    = "private"
#   policy = data.aws_iam_policy_document.s3_policy_cf_bucket.json

#   tags = {
#     Name        = local.log_bucket_name
#     Project     = var.project
#     Environment = var.environment
#   }
# }

data "aws_cloudfront_cache_policy" "managed_cachingoptimized" {
  name = "Managed-CachingOptimized"
}

resource "aws_cloudfront_distribution" "cf" {
  comment             = local.name
  aliases             = local.hosts_project
  enabled             = true
  default_root_object = "index.html"
  depends_on          = [aws_cloudfront_function.add_header_medarcade, aws_cloudfront_function.redirect_medarcade]
  web_acl_id          = data.aws_wafv2_web_acl.waf_cloudfront.arn

  origin {
    domain_name = "${aws_s3_bucket.bucket.id}.s3.amazonaws.com"
    origin_id   = "S3-${aws_s3_bucket.bucket.id}"
    # origin_path = "/index.html"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  # origin {
  #   domain_name = "${aws_s3_bucket.inscricao.id}.s3.amazonaws.com"
  #   origin_id   = "S3-${aws_s3_bucket.inscricao.id}"
  #   # origin_path = "/index.html"

  #   s3_origin_config {
  #     origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
  #   }
  # }

  default_cache_behavior {
    # path_pattern           = "*"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "S3-${aws_s3_bucket.bucket.id}"
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
    compress               = true
    cache_policy_id        = data.aws_cloudfront_cache_policy.managed_cachingoptimized.id

    # forwarded_values {
    #   query_string = false

    #   cookies {
    #     forward = "none"
    #   }
    # }

    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.redirect_medarcade.arn
    }

    function_association {
      event_type   = "viewer-response"
      function_arn = aws_cloudfront_function.add_header_medarcade.arn
    }
  }

  # ordered_cache_behavior {
  #   path_pattern           = "img/*/*.*"
  #   allowed_methods        = ["GET", "HEAD"]
  #   cached_methods         = ["GET", "HEAD"]
  #   target_origin_id       = "S3-${data.aws_s3_bucket.selected.id}"
  #   viewer_protocol_policy = "redirect-to-https"
  #   min_ttl                = 0
  #   default_ttl            = 3600
  #   max_ttl                = 86400
  #   compress = true

  #   forwarded_values {
  #     query_string = false

  #     cookies {
  #       forward = "none"
  #     }
  #   }
  # }

  # ordered_cache_behavior {
  #   path_pattern           = "transferencia"
  #   allowed_methods        = ["GET", "HEAD"]
  #   cached_methods         = ["GET", "HEAD"]
  #   target_origin_id       = "S3-${aws_s3_bucket.inscricao.id}"
  #   viewer_protocol_policy = "redirect-to-https"
  #   min_ttl                = 3600
  #   default_ttl            = 3600
  #   max_ttl                = 86400
  #   compress               = true

  #   forwarded_values {
  #     query_string = false

  #     cookies {
  #       forward = "none"
  #     }
  #   }
  # }

  # ordered_cache_behavior {
  #   path_pattern           = "transferencia/*"
  #   allowed_methods        = ["GET", "HEAD"]
  #   cached_methods         = ["GET", "HEAD"]
  #   target_origin_id       = "S3-${aws_s3_bucket.inscricao.id}"
  #   viewer_protocol_policy = "redirect-to-https"
  #   min_ttl                = 3600
  #   default_ttl            = 3600
  #   max_ttl                = 86400
  #   compress               = true

  #   forwarded_values {
  #     query_string = false

  #     cookies {
  #       forward = "none"
  #     }
  #   }

  #   # function_association {
  #   #   event_type   = "viewer-request"
  #   #   function_arn = data.aws_cloudfront_function.redirect_faculade.arn
  #   # }
  # }

  custom_error_response {
    error_code         = "403"
    response_code      = "200"
    response_page_path = "/index.html"
  }

  custom_error_response {
    error_code         = "404"
    response_code      = "200"
    response_page_path = "/index.html"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # logging_config {
  #   include_cookies = false
  #   bucket          = "mylogs.s3.amazonaws.com"
  #   prefix          = "myprefix"
  # }

  viewer_certificate {
    acm_certificate_arn            = data.aws_acm_certificate.grupointegrado.arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1"
    cloudfront_default_certificate = false
  }

  tags = {
    Name        = "${var.prefix}-${var.environment}-cluster"
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
}
