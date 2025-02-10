resource "aws_cloudfront_vpc_origin" "alb_vpc_origin" {
  vpc_origin_endpoint_config {
    name                   = "internal-alb-tf"
    arn                    = aws_lb.bia_alb_internal_tf.arn
    http_port              = 80
    https_port             = 443
    origin_protocol_policy = "match-viewer"

    origin_ssl_protocols {
      items    = ["TLSv1.2"]
      quantity = 1
    }
  }
}

