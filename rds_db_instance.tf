resource "aws_db_instance" "db_bia_tf" {
  identifier            = "db-bia-tf"
  allocated_storage     = 20  # Mínimo para RDS
  storage_type          = "gp2"
  engine               = "postgres"
  engine_version       = "16.3"
  instance_class       = "db.t4g.micro"
  username             = "postgres"
  password             = null
  parameter_group_name = "default.postgres16"
  publicly_accessible  = false
  skip_final_snapshot  = true
  backup_retention_period = 0  # Sem backups
  vpc_security_group_ids = [aws_security_group.bia_db_tf.id]
  db_subnet_group_name   = aws_db_subnet_group.bia_tf_subnet_group.name 
  multi_az               = false
  storage_encrypted      = true
  manage_master_user_password = true

    
    tags = {
        Name = "db-bia-tf"
    }

}

resource "aws_db_subnet_group" "bia_tf_subnet_group" {
  name = "bia-tf-subnet-group"
  subnet_ids = [aws_subnet.subnet_privada_zona_a.id,aws_subnet.subnet_privada_zona_b.id]
  
  tags = {
    name = "bia-subnet-group"
  }
}