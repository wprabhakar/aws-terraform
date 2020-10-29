variable "az_count" {
  description = "Number of Subnets"
  default = 2 
}

variable "cloudwatch_group" {
  description = "cloud watch group"
  default = "student_api"
}
