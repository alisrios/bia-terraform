resource "aws_autoscaling_group" "ecs" {
  name_prefix               = "cluster-ecs-bia-asg-tf-"
  vpc_zone_identifier       = [aws_subnet.subnet_publica_zona_a.id, aws_subnet.subnet_publica_zona_b.id]
  min_size                  = 0
  desired_capacity          = 1
  max_size                  = 2
  health_check_grace_period = 0
  health_check_type         = "EC2"
  protect_from_scale_in     = false

  launch_template {
    id      = aws_launch_template.ecs_ec2.id
    version = "$Latest"
  }

  lifecycle {
    ignore_changes = [desired_capacity]
  }
  
  tag {
    key                 = "Name"
    value               = "cluster-bia-tf"
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = ""
    propagate_at_launch = true
  }
}
