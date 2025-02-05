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

data "aws_security_group" "cloudfront_vpc_origin_sg" {
  filter {
    name   = "group-name"
    values = ["CloudFront-VPCOrigins-Service-SG"]
  }

  filter {
    name   = "vpc-id"
    values = [aws_vpc.bia_tf_vpc.id]  # Substitua pelo ID do VPC onde está o ALB
  }
}
