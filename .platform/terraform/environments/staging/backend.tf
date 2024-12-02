terraform {
  backend "s3" {
    bucket = "example-app-eu-west-1-meta"
    key    = "iac/terraform.tfstate"
    region = "eu-west-1"
  }
}
