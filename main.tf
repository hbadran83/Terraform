# Provider
 provider "aws" {
   access_key = ""
   secret_key = ""
   region = ""
 }

# Retrieve the AZ where we want to create network resources
data "aws_availability_zones" "available" {}

# VPC Resource
resource "aws_vpc" "main" {
  cidr_block = "10.11.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
    Name = "Test-VPC"
  }
  tags {
    Environment = "Test"
  }
}

# AWS subnet resource
resource "aws_subnet" "test" {
 vpc_id = "${aws_vpc.main.id}"
 cidr_block = "10.11.1.0/24"
 availability_zone = "${data.aws_availability_zones.available.names[0]}"
 map_public_ip_on_launch = "false"
 tags {
   Name = "Test_subnet1"
 }
}
