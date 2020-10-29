variable "az_count" {
  description = "Number of Subnets"
  default = 2 
}

variable "cloudwatch_group" {
  description = "cloud watch group"
  default = "student-api"
}

variable "ecs_cluster" {
  default = "student-api-cluster"
}

variable "app_family" {
  default = "student-api-family"
}

variable "container_name" {
  default = "student-api"
}
