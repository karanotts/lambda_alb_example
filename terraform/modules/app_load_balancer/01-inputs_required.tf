variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "project" {
  type = string
}

variable "lambda_arn" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "security_group" {
  type = list(string)
}