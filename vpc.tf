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

  tags = {
    Name = "subnet-publica-zona-a"
  }
}

##Criar Subnet Publica zona b
resource "aws_subnet" "subnet_publica_zona_b" {
  vpc_id     = aws_vpc.bia_tf_vpc.id
  cidr_block = "10.0.16.0/20"
  availability_zone = "us-east-1b"

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
