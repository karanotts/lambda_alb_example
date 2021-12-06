variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "project" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}