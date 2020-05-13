provider "aws" {
    access_key = "AKIAT32XXE6UPQAYYXBC"
    secret_key = "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"
    region = "us-east-2"
}

data "aws_ami" "myubuntuAmi" {
most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }   

    owners = ["099720109477"]

}

resource "aws_instance" "myweb_instance" {
ami = "${data.aws_ami.myubuntuAmi.id}"
  instance_type = "t2.micro"

  tags = {
      name = "AEM_author"
    }
}
