output "public_subnets" {
  value = aws_subnet.public_subnets.*.id
}

output "security_group" {
  value = aws_security_group.allow_http.id
}