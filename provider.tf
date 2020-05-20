provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket         = "cloudiarterraform"
    key            = "terraform.tfstate"
    region         = "${var.region}"
    dynamodb_table = "tuesday-tf"
  }
}
