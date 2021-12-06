resource "aws_lb_target_group" "lambda_target_group" {
  name        = "${var.project}-${var.environment}-lb-tg"
  target_type = "lambda"
}

resource "aws_lb_target_group_attachment" "lambda" {
  target_group_arn = aws_lb_target_group.lambda_target_group.arn
  target_id        = var.lambda_arn
  depends_on       = [aws_lambda_permission.with_lb]
}

resource "aws_lambda_permission" "with_lb" {
  statement_id  = "AllowExecutionFromlb"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = aws_lb_target_group.lambda_target_group.arn
}