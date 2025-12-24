locals {
  instances = ["testserver", "K8main"]
}

resource "aws_instance" "ec2" {
  for_each = toset(local.instances)

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = each.key
  }
}
