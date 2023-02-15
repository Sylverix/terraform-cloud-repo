provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "latest-linux-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "demo-ec2" {
  ami = data.aws_ami.latest-linux-ami.id
  instance_type = "t2.micro"
}
