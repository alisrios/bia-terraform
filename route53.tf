data "aws_route53_zone" "primary" {
  name = "alisriosti.com.br"
}

resource "aws_route53_record" "bia_tf" {
  zone_id = data.aws_route53_zone.primary.zone_id # Substitua pelo ID correto da sua zona
  name    = "bia-tf.alisriosti.com.br"
  type    = "CNAME"
  ttl     = 300
  records = [aws_cloudfront_distribution.bia_tf.domain_name]
}
