resource "aws_iam_instance_profile" "test-ssm" {
  name = "test-ssm"
  role = "test-ssm"
}

resource "aws_iam_role" "test-ssm" {
  name = "test-ssm"
  assume_role_policy = data.aws_iam_policy_document.test-ssm.json
}

data "aws_iam_policy_document" "test-ssm" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role_policy_attachment" "test-ssm-AmazonSSMManagedInstanceCore" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.test-ssm.name
}
