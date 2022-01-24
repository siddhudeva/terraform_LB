data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraformbucket021"
    key    = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}
