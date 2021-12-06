resource "aws_lb" "lambda_alb" {
  name               = "${var.project}-${var.environment}-alb"
  load_balancer_type = "application"
  security_groups    = var.security_group
  subnets            = var.public_subnets

  tags = {
    Environment = var.environment
  }
}