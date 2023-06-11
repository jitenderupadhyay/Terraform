terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "terraform-practice-jeet"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-locks-jeet"
    encrypt        = true
  }
}