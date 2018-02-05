# Terraform Settings
# # https://www.terraform.io/docs/configuration/terraform.html
terraform {
  required_version = ">= 0.11.3"
}

# Output
# # https://www.terraform.io/docs/configuration/outputs.html
output "addrs" {
  value = ["${aws_instance.main.public_ip}"]
}

# Variables
# # https://www.terraform.io/docs/configuration/variables.html
variable "ProjectName" {
  type    = "string"
  default = "SimpleEC2Template"
}

variable "CIDR_Block" {
  type    = "string"
  default = "10.0.1.0/24"
}

# Provider
# # https://www.terraform.io/docs/providers/aws/index.html
provider "aws" {
  # alias   = "tokyo"
  region  = "ap-northeast-1"
  profile = "sample-profile"
}

# # https://www.terraform.io/docs/providers/aws/r/key_pair.html
resource "aws_key_pair" "main" {
  key_name   = "${var.ProjectName}"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
