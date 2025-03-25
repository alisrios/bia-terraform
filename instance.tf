# Intancia EC2 bia-dev-tf
resource "aws_instance" "bia_dev_tf" {
  ami           = "ami-0b29c89c15cfb8a6d"
  instance_type = "t4g.small"
  #key_name = "bia-dev-tf"
  subnet_id                   = aws_subnet.subnet_publica_zona_a.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.bia_dev_tf.id]
  iam_instance_profile        = aws_iam_instance_profile.role_acesso_ssm.name

  #user_data
  user_data = file("user_data_bia_dev_tf.sh")

  #volume
  root_block_device {
    volume_size = 15
    volume_type = "gp3"
    encrypted   = true
  }
  tags = {
    Name     = var.aws_instance_name
    ambiente = "dev"
  }
}