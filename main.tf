terraform { 
  backend "remote" { 
    hostname = "terrakube-api.terrakube-poc.fun"
    organization = "simple" 

    workspaces { 
      name = "workspace2" 
    } 
  } 
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-names-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}