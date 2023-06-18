provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

module "s3" {
  source            = "./s3"
  bucket_versioning = "Enabled"
  bucket_encryption = "AES256"
}

module "sqs_main" {
  source   = "./sqs"
  sqs_name = "my_queue"
}

module "sqs_secondary" {
  source   = "./sqs"
  sqs_name = "my_queue2"
}

module "sqs_tertiary" {
  source   = "./sqs"
  sqs_name = "my_queue3"
}