resource "aws_cloudwatch_log_group" "ecs_bia_web" {
  name              = "/ecs/bia-web-tf"
  retention_in_days = 7
}