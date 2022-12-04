data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    image_id   = "image_id"
    values = ["ami-0695144fa1270e177"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["520305454483"] # Bitnami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld"
  }
}
