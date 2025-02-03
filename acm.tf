data "aws_acm_certificate" "certificado" {
  domain   = "*.alisriosti.com.br"
  statuses = ["ISSUED"]
}
