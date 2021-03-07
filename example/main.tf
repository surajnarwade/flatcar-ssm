data "aws_ami" "image" {
  most_recent = true

  filter {
    name = "name"
    # values = ["base-image-fc-b4b2c239"]
    values = ["Flatcar-stable-2079.3.0-hvm"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # owners = ["477284023816"]
  owners = ["075585003325"]
}

resource "aws_instance" "test-ssm" {

  ami                         = data.aws_ami.image.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.test-ssm.name

  subnet_id = "subnet-02b8e305601ad20be"

  vpc_security_group_ids = ["sg-0f4a2577133335c3d"]

  user_data = data.ct_config.ignition.rendered


  key_name = "suraj-keypair"

  tags = {
    Name = "test-ssm"
  }
}
