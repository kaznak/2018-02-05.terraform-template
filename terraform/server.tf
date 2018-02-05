# EC2

## Instance
## # https://www.terraform.io/docs/providers/aws/r/instance.html

resource "aws_instance" "main" {
  instance_type = "t2.micro"

  # Public / Official / Ubuntu 16.04
  ami = "ami-48630c2e"

  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]

  subnet_id                   = "${aws_subnet.main.id}"
  associate_public_ip_address = "true"

  key_name = "${aws_key_pair.main.key_name}"

  tags {
    Name      = "${var.ProjectName}"
    Project   = "${var.ProjectName}"
    Terraform = "true"
  }
}

## Security Groups
## # https://www.terraform.io/docs/providers/aws/r/security_group.html
resource "aws_security_group" "allow_all" {
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name      = "${var.ProjectName}"
    Project   = "${var.ProjectName}"
    Terraform = "true"
  }
}
