terraform {
  backend "s3" {
    profile        = "HoneyToken-ISAA" # Use same value as in tfvars
    region         = "us-east-1" # Use same value as in tfvars
    bucket         = "honeytoken-22-11-23-pawanawsaccount" # Use same value as in tfvars
    key            = "terraform.tfstate"
    dynamodb_table = "ggcanary-state-lock"
  }
}
