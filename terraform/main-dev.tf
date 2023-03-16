resource "aws_iam_user" "user2" {
  name = "harry"
  path = "/"

    tags = {
        tag-key = "user-ec2-s3"
    }
}

resource "aws_iam_access_key" "user2" {
  user = aws_iam_user.user2.name
}

data "aws_iam_policy_document" "user2_policy" {
    statement {
            effect    = "Allow"
            actions   = ["ec2:*","elasticloadbalancing:*","cloudwatch:*","autoscaling:*","s3:*","s3-object-lambda:*"]
            resources = ["*"]
    }
}

resource "aws_iam_user_policy" "user2_policy" {
    name = "test"
    user = aws_iam_user.user2.name 
    policy = data.aws_iam_policy_document.user2_policy.json
}