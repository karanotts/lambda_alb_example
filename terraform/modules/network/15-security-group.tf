resource "aws_security_group" "allow_http" {
  name        = "${var.project}-${var.environment}-allow-http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.lambda_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}