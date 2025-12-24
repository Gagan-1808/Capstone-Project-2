output "instance_public_ips" {
  value = values(aws_instance.ec2)[*].public_ip
}

output "instance_private_ips" {
  value = values(aws_instance.ec2)[*].private_ip
}

output "instance_ids" {
  value = values(aws_instance.ec2)[*].id
}
