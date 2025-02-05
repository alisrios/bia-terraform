output "instance_ip" {
  description = "Ip da instancia bia-dev-tf"
  value = aws_instance.bia_dev_tf.public_ip  
}

output "rds_endpoint" {
  description = "Endpoint do RDS da BIA"
  value       = aws_db_instance.db_bia_tf.endpoint
}

output "rds_secrets" {
  description = "Secrets associado ao RDS"
  value       = aws_db_instance.db_bia_tf.master_user_secret[0].secret_arn
}

output "rds_secret_name" {
  description = "Nome do meu segredo"
  value = data.aws_secretsmanager_secret.db_bia_tf.name
}  

output "bia_repo_url" {
  value = aws_ecr_repository.bia_tf.repository_url
}

output "alb_url" {
  value = aws_lb.bia_alb_internal_tf.dns_name
}

output "certificado_arn" {
  value = data.aws_acm_certificate.certificado.arn
}

output "cloudfront_vpc_origin_sg_id" {
  value = data.aws_security_group.cloudfront_vpc_origin_sg.id
}