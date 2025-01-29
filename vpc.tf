##Criar VPC
resource "aws_vpc" "bia_tf_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "bia-tf-vpc"
  }
}

##Criar Subnet Publica zona a
resource "aws_subnet" "subnet_publica_zona_a" {
  vpc_id     = aws_vpc.bia_tf_vpc.id
  cidr_block = "10.0.0.0/20"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true  # Habilita IP público automático

  tags = {
    Name = "subnet-publica-zona-a"
  }
}

##Criar Subnet Publica zona b
resource "aws_subnet" "subnet_publica_zona_b" {
  vpc_id     = aws_vpc.bia_tf_vpc.id
  cidr_block = "10.0.16.0/20"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true  # Habilita IP público automático

  tags = {
    Name = "subnet-publica-zona-b"
  }
}

##Criar Subnet Privada zona a
resource "aws_subnet" "subnet_privada_zona_a" {
  vpc_id     = aws_vpc.bia_tf_vpc.id
  cidr_block = "10.0.128.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-privada-zona-a"
  }
}

##Criar Subnet Privada zona b
resource "aws_subnet" "subnet_privada_zona_b" {
  vpc_id     = aws_vpc.bia_tf_vpc.id
  cidr_block = "10.0.144.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet-privada-zona-b"
  }
}

# Criar o Internet Gateway
resource "aws_internet_gateway" "bia_tf_igw" {
  vpc_id = aws_vpc.bia_tf_vpc.id

  tags = {
    Name = "bia-tf-igw"
  }
}

# Criar a rota para o Internet Gateway
resource "aws_route_table" "bia_tf_route_table" {
  vpc_id = aws_vpc.bia_tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bia_tf_igw.id
  }

  tags = {
    Name = "bia-tf-route-table"
  }
}

# Associar a rota a subnet publica zona a
resource "aws_route_table_association" "bia_tf_route_table_association_subnet_publica_zona_a" {
  subnet_id      = aws_subnet.subnet_publica_zona_a.id
  route_table_id = aws_route_table.bia_tf_route_table.id
}

# Associar a rota a subnet publica zona b
resource "aws_route_table_association" "bia_tf_route_table_association_subnet_publica_zona_b" {
  subnet_id      = aws_subnet.subnet_publica_zona_b.id
  route_table_id = aws_route_table.bia_tf_route_table.id
}

# Criar Tabela de Rotas Privada
resource "aws_route_table" "bia_tf_route_table_privada" {
  vpc_id = aws_vpc.bia_tf_vpc.id

  tags = {
    Name = "bia-tf-route-table-privada"
  }
}

# Associar a rota a subnet privada zona a
resource "aws_route_table_association" "bia_tf_route_table_association_subnet_privada_zona_a" {
  subnet_id      = aws_subnet.subnet_privada_zona_a.id
  route_table_id = aws_route_table.bia_tf_route_table_privada.id
}

# Associar a rota a subnet privada zona b
resource "aws_route_table_association" "bia_tf_route_table_association_subnet_privada_zona_b" {
  subnet_id      = aws_subnet.subnet_privada_zona_b.id
  route_table_id = aws_route_table.bia_tf_route_table_privada.id
}
