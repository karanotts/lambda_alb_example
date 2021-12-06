resource "aws_subnet" "public_subnets" {
  count                = length(var.public_subnets)
  vpc_id               = aws_vpc.lambda_vpc.id
  cidr_block           = element(concat(var.public_subnets, [""]), count.index)
  availability_zone    = length(regexall("^[a-z]{2}-", element(var.availability_zones, count.index))) > 0 ? element(var.availability_zones, count.index) : null
  availability_zone_id = length(regexall("^[a-z]{2}-", element(var.availability_zones, count.index))) == 0 ? element(var.availability_zones, count.index) : null

  tags = {
    Name = "${var.project}-${var.environment}-${format("%02d", count.index)}-subnet",

  }
}

