# Provider configuration for AWS
provider "aws" {
  region     = "us-east-1"
}

# Create the VPC
resource "aws_vpc" "demo" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "DemoVPC"
  }
}

# Create the public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "PublicSubnet"
  }
}

# Create the private subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "PrivateSubnet"
  }
}

# Create a security group allowing SSH access from anywhere
resource "aws_security_group" "ssh" {
  name_prefix = "ssh"
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch the first EC2 instance in the public subnet
resource "aws_instance" "public_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ssh.id]
  tags = {
    Name = "PublicInstance"
  }
}

# Launch the second EC2 instance in the private subnet
resource "aws_instance" "private_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.ssh.id]
  tags = {
    Name = "PrivateInstance"
  }
}
