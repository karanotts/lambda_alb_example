resource "aws_lambda_function" "lambda" {
  filename      = "lambda_function_payload.zip"
  function_name = "${var.project}-${var.environment}-lambda"
  role          = aws_iam_role.iam_lambda_role.arn
  handler       = var.handler

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256(var.payload)

  runtime = var.runtime

  environment {
    variables = {
      BUCKET_NAME = var.bucket_name
    }
  }
}