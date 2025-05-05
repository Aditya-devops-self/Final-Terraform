provider "aws" {
region     = var.aws_region
access_key = var.aws_access_key
secret_key = var.aws_secret_key

}

resource "aws_instance" "example" {
  ami           = "ami-07b0c09aab6e66ee9"  
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-super-619"  
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}
