# bia-terraform-vpc-origin

## Arquivos Terraform

### 1. `state_config.tf`
Configura o backend do Terraform para armazenar o estado em um bucket S3.

### 2. `acm.tf`
Busca o certificado ACM para o domínio `*.alisriosti.com.br`.

### 3. `asg_ecs.tf`
Define o Auto Scaling Group (ASG) para o cluster ECS, incluindo hooks de ciclo de vida.

### 4. `cloudfront.tf`
Configura a distribuição do CloudFront para o domínio `bia-tf.alisriosti.com.br`.

### 5. `cloudwatch_log_group.tf`
Cria um grupo de logs no CloudWatch para o ECS.

### 6. `ecr.tf`
Cria um repositório no Elastic Container Registry (ECR) para armazenar imagens Docker.

### 7. `ecs_capacity_provider.tf`
Configura o ECS Capacity Provider e associa ao cluster ECS.

### 8. `ecs_cluster.tf`
Cria o cluster ECS.

### 9. `ecs_launch_template.tf`
Define o Launch Template para instâncias do ECS com suporte a SSM e configuração de inicialização.

### 10. `ecs_service.tf`
Configura o serviço ECS, incluindo balanceamento de carga e estratégias de capacidade.

### 11. `ecs_task_definition.tf`
Define a Task Definition para o ECS, incluindo configurações de container e logs.

### 12. `iam_ecs_role.tf`
Cria as roles IAM necessárias para instâncias ECS e execução de tarefas.

### 13. `iam_ecs_task_role.tf`
Define a role IAM para tarefas ECS com permissões para acessar secrets.

### 14. `iam.tf`
Configura a role IAM para acesso ao SSM e permissões adicionais.

### 15. `instance.tf`
Cria uma instância EC2 para desenvolvimento com Docker e Node.js pré-instalados.

### 16. `output.tf`
Define os outputs do Terraform, como IP da instância, endpoint do RDS e URL do ALB.

### 17. `provider.tf`
Configura o provider AWS e a role assumida pelo Terraform.

### 18. `rds_db_instance.tf`
Cria uma instância RDS PostgreSQL e um grupo de sub-redes.

### 19. `route53.tf`
Configura um registro CNAME no Route 53 para o domínio do CloudFront.

### 20. `secrets_db.tf`
Busca o secret associado ao RDS no Secrets Manager.

### 21. `security_group.tf`
Define os Security Groups para EC2, ALB, RDS e outros recursos.

### 22. `user_data_bia_dev_tf.sh`
Script de inicialização para a instância EC2, instalando Docker, Node.js e configurando swap.

### 23. `variables.tf`
Define variáveis usadas no Terraform, como o nome da instância EC2.

### 24. `vpc_origin.tf`
Configura o VPC Origin para o CloudFront.

### 25. `vpc.tf`
Cria a VPC, sub-redes públicas e privadas, e tabelas de rotas.

### 26. `alb_internal.tf`
Configura o Application Load Balancer (ALB) interno e seus listeners.