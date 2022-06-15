variable "type_ami" {
  type = "string"
  description = "ami que será utilizado"
  default = "ami-0c4f7023847b90238"
}

variable "type_instance" {
  type = "string"
  description = "Familia da instância"
  default = "t2.micro"
}

variable "key_pair" {
  type = "string"
  description = "Chave que deve ser utilizada"
  default = "jlucas"
}

variable "region" {
    type = "string"
    description = "Região que será utilizada"
    default = "us-east-1"
  
}

variable "provider" {
    type = "string"
    description = "Provider que será utilizado"
    default = "aws"
  
}
variable "aws_security_group" {
    type = "string"
    description = "Nome do grupo de segurança"
    default = vpc.aws_security_group.public.id
  
}