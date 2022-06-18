data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  
  owners = ["099720109477"]

}

resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  security_groups        = [aws_security_group.public.id]
  vpc_security_group_ids = [aws_security_group.public.id]
  subnet_id              = aws_subnet.public.id
  key_name               = "joaolfms"
  associate_public_ip_address = true
  user_data = file("userdata.tpl")
  tags = {
    Name = var.name #"WebServer"
    Environment = var.env
    provisioner = "terraform"
    repo = var.repo
  } 
}