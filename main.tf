resource "aws_instance" "app_server" {
  ami           = "ami-0c4f7023847b90238"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.public.id]
  vpc_security_group_ids = [aws_security_group.public.id]
  subnet_id = aws_subnet.public.id
  key_name = "jlucas"
  associate_public_ip_address = true
  connection {
    type =        "ssh"
    user =        "ubuntu"
    private_key =  file("/home/joao/Downloads/jlucas.pem")
    host =        aws_instance.app_server.public_ip
    }
  
    provisioner "remote-exec" {
    inline = [
    "curl -fsSL https://get.docker.com | sh",
    "sudo usermod -aG docker $USER",
    "sudo systemctl enable docker",
    "sudo systemctl restart docker",
    "sudo docker run -d nginx"
    ]
  }
  tags = {
    Name = "WebServer"
  } 
}