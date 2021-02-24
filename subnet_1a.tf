resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.dev.id
  availability_zone = "us-west-1a"
  cidr_block        = "3.0.1.0/24"

  tags  = {
    Name = "public-1a"
  }
}