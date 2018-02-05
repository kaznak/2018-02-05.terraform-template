# Network

# # https://www.terraform.io/docs/providers/aws/r/vpc.html
resource "aws_vpc" "main" {
  cidr_block = "${var.CIDR_Block}"

  tags {
    Name      = "${var.ProjectName}"
    Project   = "${var.ProjectName}"
    Terraform = "true"
  }
}

# # https://www.terraform.io/docs/providers/aws/r/internet_gateway.html
resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name      = "${var.ProjectName}"
    Project   = "${var.ProjectName}"
    Terraform = "true"
  }
}

# # https://www.terraform.io/docs/providers/aws/r/route_table.html
resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name      = "${var.ProjectName}"
    Project   = "${var.ProjectName}"
    Terraform = "true"
  }
}

# # https://www.terraform.io/docs/providers/aws/r/main_route_table_assoc.html
resource "aws_main_route_table_association" "main" {
  vpc_id         = "${aws_vpc.main.id}"
  route_table_id = "${aws_route_table.main.id}"
}

# The ACL will be full open one by default.

# # https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.CIDR_Block}"

  tags {
    Name      = "${var.ProjectName}"
    Project   = "${var.ProjectName}"
    Terraform = "true"
  }
}
