resource "aws_iam_user" "iam_users" {
  name  = var.iam_user_name[count.index]
  count = 3
}

resource "aws_iam_user_policy" "iam_user_policy" {
  name  = "${aws_iam_user.iam_users[count.index].name}-policy"
  user  = aws_iam_user.iam_users[count.index].name
  count = length(aws_iam_user.iam_users)

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:DescribeInstances",
          "ec2:StartInstances",
          "ec2:StopInstances"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [

          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:RevokeSecurityGroupIngress"
        ]
        Effect   = "Deny"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "allow_s3_list_bucket" {
  name        = "allow_s3_list_bucket"
  description = "Policy that allows listing S3 buckets"

  policy = file("${path.module}/s3-allow-list-policy.json")
}

resource "aws_iam_user_policy_attachment" "assign_policy_to_user" {
  count      = length(aws_iam_user.iam_users)
  user       = aws_iam_user.iam_users[count.index].name
  policy_arn = aws_iam_policy.allow_s3_list_bucket.arn
}