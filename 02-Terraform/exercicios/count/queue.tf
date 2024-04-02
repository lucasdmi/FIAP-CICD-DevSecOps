provider "aws" {
  region = "us-east-1"
}

resource "aws_sqs_queue" "terraform_queue" {
  name= "terraform-example-queue"

  count = 1
  
  tags = {
    Environment = "${format("production-%03d", count.index + 1)}"
  }
}



