provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}


resource "aws_instance" "MyFirstInstnace" {
  ami           = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"

  tags = {
    name = "sampleEC1"
  }
}

resource "aws_iam_role" "sqs_role" {
  name = "sqs_role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17"
    "Statement" : [
      {
        "Effect" : "Allow"
        "Principal" : {
          "Service" : "sqs.amazonaws.com"
        }
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_sqs_queue" "my_queue" {
  name                       = "my_queue"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600
  receive_wait_time_seconds  = 20
  visibility_timeout_seconds = 30
}

resource "aws_sqs_queue_policy" "my_sqs_policy" {
  queue_url = aws_sqs_queue.my_queue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:*",
      "Resource": "${aws_sqs_queue.my_queue.arn}"
    }
  ]
}
POLICY
}