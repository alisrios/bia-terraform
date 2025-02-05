resource "aws_ecs_task_definition" "bia_web" {
  family                   = "task-def-bia-tf"
  network_mode             = "bridge"
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn  # Adicionando a Task Execution Role
  container_definitions    = jsonencode([{
    name                   = "bia-tf"
    image                  = "${aws_ecr_repository.bia_tf.repository_url}:latest"
    essential              = true
    portMappings           = [{
      containerPort        = 8080
      hostPort             = 0
      name                 = "porta-aleatoria"  # Nome da porta
      appProtocol          = "http"             # Protocolo da aplicação
    }]
    cpu                    = 1024
    memoryReservation      = 410
    environment            = [
      { name = "DB_PORT", value = "5432" },
      { name = "DB_HOST", value = "${aws_db_instance.db_bia_tf.address}" },
      { name = "DB_SECRET_NAME", value = "${data.aws_secretsmanager_secret.db_bia_tf.name}" },
      { name = "DB_REGION", value = "us-east-1" },
      { name = "DEBUG_SECRET", value = "false" },
    ]
    logConfiguration       = {
      logDriver            = "awslogs"
      options              = {
        "awslogs-region"   = "us-east-1"
        "awslogs-group"    = aws_cloudwatch_log_group.ecs_bia_web.name
        "awslogs-stream-prefix" = "bia-tf"
      }
    }
  }])

  runtime_platform {
    cpu_architecture       = "ARM64"
    operating_system_family = "LINUX"
  }
}