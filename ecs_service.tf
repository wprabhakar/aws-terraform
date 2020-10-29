resource "aws_ecs_service" "worker" {
  name            = "${var.container_name}-service"
//  name            = var.container_name
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 1
  // launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_alb_target_group.student_api.id
    container_name   = var.container_name
    container_port   = 8080
  }

//  depends_on = [ aws_alb_listener.front_end, aws_iam_role_policy_attachment.ecs_task_execution_role ]
}

