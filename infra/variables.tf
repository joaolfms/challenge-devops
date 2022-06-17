variable "region" {
  description = "Define what region the instance will be deployed"
  default     = "us-east-1"
}

variable "name" {
  description = "Name of the application"
  default     = "WebServer"
}

variable "env" {
  description = "Environment of the application"
  default     = "Development"
}

variable "instance_type" {
  description = "AWS Instance type define the hardware configuration of the instance"
  default     = "t2.micro"
}

variable "repo" {
  description = "Repository of the application"
  default     = "https://github.com/joaolfms/challenge-devops"
}

variable "script" {
  description = "Script to be executed on the instance"
  default     = "sudo apt-get update && sudo curl -fsSL https://get.docker.com | sh && sudo usermod -aG docker $USER && sudo systemctl enable docker && sudo systemctl restart docker"
}
