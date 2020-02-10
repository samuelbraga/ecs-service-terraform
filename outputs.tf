output "service_ecs_id" {
  value = "${aws_ecs_service.api.id}"
}

output "lb_id" {
  value = "${aws_lb.lb.id}"
}

output "lb_arn" {
  value = "${aws_lb.lb.arn}"
}

output "lb_dns_name" {
  value = "${aws_lb.lb.dns_name}"
}

output "service_ecs_name" {
  value = "${aws_ecs_service.api.name}"
}