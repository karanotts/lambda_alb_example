resource "aws_route_table" "lambda_public_route_table" {
  vpc_id = aws_vpc.lambda_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lambda_vpc_igw.id
  }

  tags = {
    Environment = var.environment
    Name        = "${var.project}-${var.environment}-public-route"
  }
}


resource "aws_default_route_table" "lambda_private_route_table" {
  default_route_table_id = aws_vpc.lambda_vpc.default_route_table_id

  tags = {
    Environment = var.environment
    Name        = "${var.project}-${var.environment}-private-route"
  }
}