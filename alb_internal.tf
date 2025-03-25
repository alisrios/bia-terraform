resource "aws_lb" "bia_alb_internal_tf" {
  name               = "bia-alb-internal-tf"
  internal           = true
  load_balancer_type = "application"
  subnets            = [aws_subnet.subnet_privada_zona_a.id, aws_subnet.subnet_privada_zona_b.id]
  security_groups    = [aws_security_group.bia_alb_tf.id]
}

resource "aws_lb_target_group" "tg_bia_tf" {
  name                 = "tg-bia-tf"
  vpc_id               = aws_vpc.bia_tf_vpc.id
  protocol             = "HTTP"
  port                 = 80
  target_type          = "instance"
  deregistration_delay = 30

  health_check {
    enabled             = true
    path                = "/api/versao"
    matcher             = 200
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.bia_alb_internal_tf.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_bia_tf.id
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.bia_alb_internal_tf.id
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = data.aws_acm_certificate.certificado.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_bia_tf.id
  }
}