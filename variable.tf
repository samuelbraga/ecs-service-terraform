/* AWS configuration */
variable "aws_region" { default = "us-west-2" }

/* Networking */
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "subnet_1_cidr" { default = "10.0.1.0/24" }
variable "subnet_2_cidr" { default = "10.0.2.0/24" }
variable "subnet_3_cidr" { default = "10.0.3.0/24" }

/* Cluster ECS */
variable "cluster_ecs_name" { default = "chapter" }

/*Task definition*/
variable "internal_container_port" { default = 80 }
variable "external_container_port" { default = 80 }
variable "cpu" { default = 256 }
variable "memory" { default = 512 }
variable "image" { default = "nginx" }

/* Service networking */
variable "assign_public_ip" { default = true }
variable "network_mode" { default = "awsvpc" }
variable "protocol" { default = "HTTP" }
variable "security_group_name" { default = "SgChapter" }
variable "sg_protocol" { default = "tcp" }

/*Service ECS*/
variable "service_name" { default = "chapter" }
variable "desired_count" { default = "1" }
variable "launch_type" { default = "FARGATE" }

/*Load balancer*/
variable "load_balancer_type" { default = "application" }
variable "internal" { default = "false" }
variable "target_type" { default = "ip" }

/* HealthCheck */
variable "interval" { default = 60 }
variable "deregistration_delay" { default = "300" }
variable "healthy_threshold" { default = 5 }
variable "unhealthy_threshold" { default = 5 }
variable "path_health_check" { default = "/" }

/*Auto scaling*/
variable "evaluation_periods" { default = 5 }
variable "statistic" { default = "Maximum" }
variable "max_capacity" { default = 5 }
variable "min_capacity" { default = 1 }

/*up*/
variable "period_up" { default = 60 }
variable "datapoints_to_alarm_up" { default = 1 }
variable "threshold_up" { default = 75 }
variable "scale_up_adjustment" { default = 1 }

/*down*/
variable "period_down" { default = 60 }
variable "threshold_down" { default = 40 }
variable "datapoints_to_alarm_down" { default = 1 }
variable "scale_down_adjustment" { default = -1 }