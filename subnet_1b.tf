resource "aws_subnet" "public_1b" {
  vpc_id            = aws_vpc.dev.id
  availability_zone = "us-west-1b"
  cidr_block        = "3.0.2.0/24"

  tags  = {
    Name = "public-1b"
  }
}
