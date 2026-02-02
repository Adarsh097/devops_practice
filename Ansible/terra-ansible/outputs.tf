output "ec2_details" {
  value = [
    for instance in aws_instance.ec2-myInstance-1 : {
      name       = instance.tags["Name"]
      public_ip  = instance.public_ip
      public_dns = instance.public_dns
    }
  ]
}
