resource "aws_vpc" "lambda_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Environment = var.environment
    Name        = "${var.project}-${var.environment}-vpc"
  }
}