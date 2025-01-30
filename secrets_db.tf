data "aws_secretsmanager_secret" "db_bia_tf" {
  arn = aws_db_instance.db_bia_tf.master_user_secret[0].secret_arn
}


