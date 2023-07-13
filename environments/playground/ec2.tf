resource "aws_instance" "this" {
    ami           = "ami-07ce6ac5ac8a0ee6f"
    instance_type = "t2.micro"
    iam_instance_profile = aws_iam_instance_profile.ec2_ssm_role.name
    security_groups = [ "Mytraffic" ]

    tags = {
      "Name" = "TestInstance"
    }
}


