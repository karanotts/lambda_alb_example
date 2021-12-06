resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.lambda.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lambda_target_group.arn
  }

  condition {
    path_pattern {
      values = ["/list"]
    }
  }

}