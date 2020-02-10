resource "aws_s3_bucket" "logs_lb" {
  bucket = "logs-${var.service_name}"
  acl    = "private"

  lifecycle_rule {
    enabled = true

    transition {
      days          = 61
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 91
      storage_class = "GLACIER"
    }

    transition {
      days          = 181
      storage_class = "DEEP_ARCHIVE"
    }
    
    expiration {
      days = 366
    }
  }

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AWSLogDeliveryWrite",
      "Effect": "Allow",
      "Principal": {
        "Service": "delivery.logs.amazonaws.com"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::logs-${var.nome_lb}/${var.nome_lb}/AWSLogs/664936341609/*",
      "Condition": {
        "StringEquals": {
          "s3:x-amz-acl": "bucket-owner-full-control"
        }
      }
    },
    {
      "Sid": "AWSLogDeliveryAclCheck",
      "Effect": "Allow",
      "Principal": {
        "Service": "delivery.logs.amazonaws.com"
      },
      "Action": "s3:GetBucketAcl",
      "Resource": "arn:aws:s3:::logs-${var.nome_lb}"
    }
  ]
}
POLICY
}