resource "aws_security_group" "public" {
  vpc_id      = aws_vpc.challenger_vpc.id
  name        = "challenger_public"
  description = "challenger_public"
}

resource "aws_security_group_rule" "public_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["177.93.158.44/32"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "public_in_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}
