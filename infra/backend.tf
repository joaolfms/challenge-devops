terraform {
  backend "s3" {
    bucket = "challenge-devops-coodesh"
    key    = "terraform-test.tfstate"
    region = "us-east-1"
  }
}