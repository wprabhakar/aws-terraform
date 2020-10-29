resource "aws_db_instance" "mysql" {
    identifier                = "mysql"
    allocated_storage         = 5
    backup_retention_period   = 0
    // backup_window             = "01:00-01:30"
    // maintenance_window        = "sun:03:00-sun:03:30"
    // multi_az                  = false
    engine                    = "mysql"
    engine_version            = "5.7"
    instance_class            = "db.t2.micro"
    name                      = "test_db"
    username                  = "student"
    password                  = "studentpassword"
    port                      = "3306"
    db_subnet_group_name      = aws_db_subnet_group.db_subnet_group.id
    vpc_security_group_ids    = [aws_security_group.rds_sg.id, aws_security_group.ecs_sg.id]
    skip_final_snapshot       = true
    // final_snapshot_identifier = "worker-final"
    // publicly_accessible       = true
}

// ecr_repository_worker_endpoint = 934611408633.dkr.ecr.ap-southeast-1.amazonaws.com/student-api
// mysql -h mysql.cr6bt9sg9xgn.ap-southeast-1.rds.amazonaws.com -P 3306 -u student -p

// resource "aws_rds_cluster" "student_db" {
//   cluster_identifier      = "student-db"
//   engine                  = "aurora-mysql"
//   engine_version          = "5.7.mysql_aurora.2.03.2"
//   availability_zones      = ["ap-southeast-1a"]
//   instance_type           = "db.t2.micro"
//   database_name           = "test_db"
//   master_username         = "worker"
//   master_password         = "workerpassword"
//   backup_retention_period = 0
//   preferred_backup_window = "07:00-09:00"
// }
