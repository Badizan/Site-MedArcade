resource "aws_cloudfront_function" "redirect_medarcade" {
  name    = "redirect_medarcade"
  runtime = "cloudfront-js-1.0"
  comment = "Function to redirect to the index.html bucket"
  publish = true
  code    = file("${path.module}/js/redirect_medarcade.js")
}

resource "aws_cloudfront_function" "add_header_medarcade" {
  name    = "add_header_medarcade"
  runtime = "cloudfront-js-1.0"
  comment = "Function to add headers bucket"
  publish = true
  code    = file("${path.module}/js/add_header_medarcade.js")
}
