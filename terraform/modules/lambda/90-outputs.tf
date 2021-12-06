output "lambda_arn" {
  value = join("", aws_lambda_function.lambda.*.arn)
}