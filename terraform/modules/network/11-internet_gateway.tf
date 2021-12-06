resource "aws_internet_gateway" "lambda_vpc_igw" {
  vpc_id = aws_vpc.lambda_vpc.id

  tags = {
    Environment = var.environment
    Name        = "${var.project}-${var.environment}-igw"
  }
}