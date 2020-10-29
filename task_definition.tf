resource "aws_ecs_task_definition" "task_definition" {
  family                = var.container_name
  container_definitions = data.template_file.task_definition_template.rendered
}