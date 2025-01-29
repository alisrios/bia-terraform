# Security Group bia-dev-tf
resource "aws_security_group" "bia_dev_tf" {
  name="bia-dev-tf"
  description = "Acesso ao bia-dev-tf"
  vpc_id = aws_vpc.bia_tf_vpc.id

  ingress {
    description = "acesso para o mundo"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Name = "bia-dev-tf"
  }

}

# Security Group bia-web-tf
resource "aws_security_group" "bia_web_tf" {
  name="bia-web-tf"
  description = "Acesso ao bia-web-tf"
  vpc_id = aws_vpc.bia_tf_vpc.id

  ingress {
    description = "acesso para o mundo"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Name = "bia-web-tf"
  }

}
  
# Security Group bia-ec2-tf
resource "aws_security_group" "bia_ec2_tf" {
  name="bia-ec2-tf"
  description = "Acesso ao bia-ec2-tf"
  vpc_id = aws_vpc.bia_tf_vpc.id

  ingress {
    description = "acesso do bia-alb-tf"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = []
    security_groups = [aws_security_group.bia_alb_tf.id]
  }
  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Name = "bia-ec2-tf"
  }

}

# Security Group bia-alb-tf
resource "aws_security_group" "bia_alb_tf" {
  name="bia-alb-tf"
  description = "Acesso ao bia-alb-tf"
  vpc_id = aws_vpc.bia_tf_vpc.id

  ingress {
    description = "acesso para o mundo"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "acesso para o mundo"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Name = "bia-alb-tf"
  }

}

# Security Group bia-ec2-tf
resource "aws_security_group" "bia_db_tf" {
  name="bia-db-tf"
  description = "Acesso ao bia-db-tf"
  vpc_id = aws_vpc.bia_tf_vpc.id

  ingress {
    description = "acesso do bia-dev-tf"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = []
    security_groups = [aws_security_group.bia_dev_tf.id]
  }
  ingress {
    description = "acesso do bia-ec2-tf"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = []
    security_groups = [aws_security_group.bia_ec2_tf.id]
  }
  ingress {
    description = "acesso do bia-web-tf"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = []
    security_groups = [aws_security_group.bia_web_tf.id]
  }
  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Name = "bia-db-tf"
  }

}