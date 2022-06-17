resource "aws_internet_gateway" "igw_challenger" {
  vpc_id = aws_vpc.challenger_vpc.id
  tags = {
    Name = "challenger_vpc_igw"
  }

}