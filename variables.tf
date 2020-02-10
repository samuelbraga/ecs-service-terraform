/*AWS configuration*/
variable "aws_region" {}

/*Cluster ECS*/
variable "cluster_name" {}

/*Networking*/
variable "vpc_id" {}
variable "subnets" {}
variable "assign_public_ip" {}
variable "network_mode" {}
variable "protocol" {}

/*Service ECS*/
variable "service_name" {}
variable "desired_count" {}
variable "launch_type" {}

/*Load balancer*/
variable "load_balancer_type" {}
variable "internal" {}
variable "logs_enabled" {}
variable "target_type" {}
variable "deregistration_delay" {}
variable "healthy_threshold" {}
variable "interval" {}
variable "path_health_check" {}

/*Task definition*/
variable "internal_container_port" {}
variable "external_container_port" {}
variable "cpu" {}
variable "memory" {}
variable "image" {}

/*Auto scaling*/
variable "evaluation_periods" {}
variable "statistic" {}
variable "max_capacity" {}
variable "min_capacity" {}

/*up*/
variable "period_up" {}
variable "datapoints_to_alarm_up" {}
variable "threshold_up" {}
variable "lowerbound" {}
variable "scale_up_adjustment" {}

/*down*/
variable "period_down" {}
variable "threshold_down" {}
variable "datapoints_to_alarm_down" {}
variable "upperbound" {}
variable "scale_down_adjustment" {}


/*Environment variable*/
variable "environment_variables" {}

/*Service discovery*/
variable "service_discovery_namespace" {}



/* Variaveis de ambiente*/
variable "access_key" {}
variable "secret_access_key" {}

variable "arn_sns_android" {}
variable "arn_sns_ios" {}

variable "rds_db_name" {}
variable "rds_hostname" {}
variable "rds_username" {}
variable "rds_password" {}
variable "rds_port" {}

variable "nome_s3" {}
variable "export_report_queue_name" {}

variable "bugsnag_key" {}

variable "smtp_server_addr" {}
variable "smtp_server_username" {}
variable "smtp_server_password" {}
variable "smtp_server_port" {}

variable "port" {}
variable "rails_env" {}
variable "secret_key_base" {}
variable "rails_max_threads" {}


/*
[
        {
          "name": "ACCESS_KEY",
          "value": "${var.access_key}"
        },
        {
          "name": "SECRET_ACCESS_KEY",
          "value": "${var.secret_access_key}"
        },  
        {
          "name": "ARN_ANDROID",
          "value": "${var.arn_sns_android}"
        },
        {
          "name": "ARN_IOS",
          "value": "${var.arn_sns_ios}"
        },
        {
          "name": "SNS_REGION",
          "value": "${var.aws_region}"
        },
        {
          "name": "RDS_DB_NAME",
          "value": "${var.rds_db_name}"
        },
        {
          "name": "RDS_HOSTNAME",
          "value": "${var.rds_hostname}"
        },
        {
          "name": "RDS_USERNAME",
          "value": "${var.rds_username}"
        },
        {
          "name": "RDS_PASSWORD",
          "value": "${var.rds_password}"
        },
        {
          "name": "RDS_PORT",
          "value": "${var.rds_port}"
        },
        {
          "name": "S3_HOSTNAME",
          "value": "${data.aws_s3_bucket.s3_dayway.bucket_domain_name}"
        },
        {
          "name": "S3_BUCKET",
          "value": "${var.nome_s3}"
        },
        {
          "name": "S3_REGION",
          "value": "${var.aws_region}"
        },
        {
          "name": "EXPORT_REPORT_QUEUE_NAME",
          "value": "${var.export_report_queue_name}"
        },
        {
          "name": "BUGSNAG_KEY",
          "value": "${var.bugsnag_key}"
        },
        {
          "name": "SMTP_SERVER_ADDR",
          "value": "${var.smtp_server_addr}"
        },
        {
          "name": "SMTP_SERVER_USERNAME",
          "value": "${var.smtp_server_username}"
        },
        {
          "name": "SMTP_SERVER_PASSWORD",
          "value": "${var.smtp_server_password}"
        },
        {
          "name": "SMTP_SERVER_PORT",
          "value": "${var.smtp_server_port}"
        },
        {
          "name": "PORT",
          "value": "${var.port}"
        },
        {
          "name": "RAILS_ENV",
          "value": "${var.rails_env}"
        },
        {
          "name": "SECRET_KEY_BASE",
          "value": "${var.secret_key_base}"
        },
        {
          "name": "RAILS_MAX_THREADS",
          "value": "${var.rails_max_threads}"
        }
*/