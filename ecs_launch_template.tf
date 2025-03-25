data "aws_ssm_parameter" "ecs_node_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2023/arm64/recommended/image_id"
}

resource "aws_launch_template" "ecs_ec2" {
  name                   = "cluster-bia-tf"
  image_id               = data.aws_ssm_parameter.ecs_node_ami.value
  instance_type          = "t4g.small"
  vpc_security_group_ids = [aws_security_group.bia_ec2_tf.id]
  iam_instance_profile { arn = aws_iam_instance_profile.role_acesso_ssm.arn }
  monitoring { enabled = false }

  user_data = base64encode(<<-EOF
      #!/bin/bash
      echo ECS_CLUSTER=${aws_ecs_cluster.cluster_bia_tf.name} >> /etc/ecs/ecs.config;
    EOF
  )
}
