data "aws_ami" "cloud-base-image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["base-image-fc-b4b2c239"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["477284023816"]
}

resource "aws_instance" "cilium-etcd" {

  ami           = data.aws_ami.cloud-base-image.id
  instance_type = "t2.medium" # "m4.large"
 associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.cilium_etcd.name
  
  subnet_id = "subnet-0649bf3af7f335405"

  vpc_security_group_ids = ["sg-0e0fad229f48b7a13"]

  user_data = data.ct_config.ignition.rendered


  key_name = "test-k8s"

  tags = {
    Name = "test-cilium-etcd"
    Role = "test-cilium-etcd"
  }
}