
data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
    arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role" "ec2_ssm_role" {
    name = "ec2_ssm_role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
                Service = "ec2.amazonaws.com"
            }
        },
        ]
    })  
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_role-attach" {
    role       = aws_iam_role.ec2_ssm_role.name
    policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}

resource "aws_iam_instance_profile" "ec2_ssm_role" {
  name = "ec2_ssm_role"
  role = aws_iam_role.ec2_ssm_role.name
}