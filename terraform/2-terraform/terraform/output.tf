output "ec2_public_ip" {
  value = [
    for instance in aws_instance.ec2-myInstance-1 : instance.public_ip
  ]
}

output "ec2_public_dns" {
  value = [
    for instance in aws_instance.ec2-myInstance-1 : instance.public_dns
  ]
}

# output "ec2_private_ip" {
#   value = aws_instance.ec2-myInstance-1[*].private_ip
# }