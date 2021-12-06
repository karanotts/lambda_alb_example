locals {
  region      = "ADD_ME"
  environment = "ADD_ME"
  project     = "ADD_ME"
  bucket_name = "ADD_ME"
}

module "lambda" {
  source      = "./terraform/modules/lambda/"
  region      = local.region
  environment = local.environment
  project     = local.project
  runtime     = "python3.9"
  payload     = "./lambda_function_payload.zip"
  handler     = "lambda_list_bucket_content.lambda_handler"
  bucket_name = local.bucket_name
}

module "app_load_balancer" {
  source         = "./terraform/modules/app_load_balancer"
  region         = local.region
  environment    = local.environment
  project        = local.project
  lambda_arn     = module.lambda.lambda_arn
  public_subnets = module.network.public_subnets
  security_group = [module.network.security_group]
}

module "network" {
  source             = "./terraform/modules/network"
  region             = local.region
  environment        = local.environment
  project            = local.project
  cidr_block         = "10.0.0.0/16"
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  availability_zones = ["${local.region}a", "${local.region}b", "${local.region}c"]
}