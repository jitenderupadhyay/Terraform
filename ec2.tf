resource "aws_instance" "MyFirstInstnace" {
  ami           = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"

  tags = {
    name = "sampleEC1"
  }
}