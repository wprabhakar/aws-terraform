resource "aws_security_group" "lb_sg" {
    name        = "loadbalancer"
    vpc_id      = aws_vpc.vpc.id

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 65535
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "ecs_sg" {
    name        = "application"
    vpc_id      = aws_vpc.vpc.id

    // ingress {
    //     from_port       = 22
    //     to_port         = 22
    //     protocol        = "tcp"
    //     cidr_blocks     = ["0.0.0.0/0"]
    // }

    ingress {
        protocol        = "tcp"
        from_port       = 0
        to_port         = 65535
        cidr_blocks     = ["0.0.0.0/0"]
        security_groups = [aws_security_group.lb_sg.id]
        // from_port       = 80
        // to_port         = 8080
        // protocol        = "tcp"
        // cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 65535
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "rds_sg" {
    name        = "database"
    vpc_id      = aws_vpc.vpc.id

    ingress {
        protocol        = "tcp"
        from_port       = 3306
        to_port         = 3306
        cidr_blocks     = ["0.0.0.0/0"]
        security_groups = [aws_security_group.ecs_sg.id]
    }

    egress {
        from_port       = 0
        to_port         = 65535
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}