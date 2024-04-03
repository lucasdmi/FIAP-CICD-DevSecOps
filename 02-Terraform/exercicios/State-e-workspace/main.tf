data "aws_ami" "example" {
  most_recent = true
   owners = ["amazon"]
  

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.202*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_instance" "test" {
  ami = data.aws_ami.example.id
  instance_type = "t2.micro"

  tags = {
    Name = "ec2-${terraform.workspace}"
  }
}

terraform {
  backend "s3" {
    bucket = "base-config-348636"
    key    = "ex-state-workspace"
    region = "us-east-1"
  }
}
