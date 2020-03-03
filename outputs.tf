output "vpc" { value = aws_vpc.vpc.id }

output "subnet_1" { value = aws_subnet.subnet_1.id }
output "subnet_2" { value = aws_subnet.subnet_2.id }
output "subnet_3" { value = aws_subnet.subnet_3.id }

output "igw" { value = aws_internet_gateway.igw.id }
output "route_table" { value = aws_route_table.route_table.id }

output "cluster_ecs" { value = aws_ecs_cluster.cluster_ecs.id }
output "service_ecs" { value = aws_ecs_service.service.id  }
output "load_balancer" { value = aws_lb.service.id  }