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
  value = aws_ecr_repository.bia.repository_url
}