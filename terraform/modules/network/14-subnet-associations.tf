resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.lambda_public_route_table.id
}