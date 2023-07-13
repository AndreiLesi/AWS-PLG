terraform {
  backend "s3" {
    bucket         = "terraform-state-443811524484"
    key            = "andreilesi/infrastructure/playground/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform"
    encrypt        = true
    kms_key_id     = "alias/tfstate"
  }
}

