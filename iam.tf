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
