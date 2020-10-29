data "template_file" "task_definition_template" {
    template = file("task_definition.json.tpl")
    vars = {
      REPOSITORY_URL = replace(aws_ecr_repository.worker.repository_url, "https://", "")
      DB_HOST = split(":",aws_db_instance.mysql.endpoint).0
      DB_PORT = aws_db_instance.mysql.port
      DB_NAME = aws_db_instance.mysql.name
      DB_USER = aws_db_instance.mysql.username
      DB_PASSWORD = aws_db_instance.mysql.password
      LOG_GROUP = var.cloudwatch_group
    }
}