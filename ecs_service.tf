resource "aws_ecs_service" "bia-tf" {
  name            = "service-bia-tf"
  cluster         = aws_ecs_cluster.cluster_bia_tf.id
  task_definition = aws_ecs_task_definition.bia_web.arn
  desired_count   = 2

  capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.bia_tf.name
    base              = 1
    weight            = 100
  }

  ordered_placement_strategy {
    type  = "spread"
    field = "attribute:ecs.availability-zone"
  }
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 100

  depends_on = [aws_lb_target_group.tg_bia_tf]

  load_balancer {
    target_group_arn = aws_lb_target_group.tg_bia_tf.arn
    container_name   = "bia-tf"
    container_port   = 8080
  }


  lifecycle {
    ignore_changes = [desired_count]
  }
}