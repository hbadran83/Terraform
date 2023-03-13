resource "aws_vpc" "main" {
  enable_dns_support   = true
  enable_dns_hostnames = true
  cidr_block           = "10.11.0.0/16"

  tags = = [
    {
      Name = "Test-VPC"
    },
    {
      Environment = "Test"
    },
  ]
}

resource "aws_subnet" "test" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = false
  cidr_block              = "10.11.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Test_subnet1"
  }
}

data "aws_availability_zones" "available" {
}

