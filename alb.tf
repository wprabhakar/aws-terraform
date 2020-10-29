resource "aws_alb" "main" {
  name            = "${var.ecs_cluster}-lb"
  subnets         = aws_subnet.pub_subnet.*.id
  security_groups = [aws_security_group.lb_sg.id]
}

resource "aws_alb_target_group" "student_api" {
  name        = "${var.ecs_cluster}-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  // target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/"
    unhealthy_threshold = "2"
  }
}

# Redirect all traffic from the ALB to the target group
resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.main.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.student_api.id
    type             = "forward"
  }
}