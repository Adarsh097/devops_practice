# key pair (login to ec2 using ssh)

resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2-ansible"
  public_key = file("terra-key-ec2-ansible.pub")
}

# vpc and security group
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
  name        = "auto-sg"
  description = "Security group for Terraform automation"
  vpc_id      = aws_default_vpc.default.id #interpolate vpc id

  #inbound rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from anywhere"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access from anywhere"

  }


  #outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "auto-sg"
  }
}

resource "aws_instance" "ec2-myInstance-1" {
  for_each = tomap({
    "Ansible-Master-ubuntu"   = "ami-087d1c9a513324697", #ubuntu
    "Ansible-worker-1-ubuntu" = "ami-087d1c9a513324697", #ubuntu
    "Ansible-worker-2-redhat" = "ami-001ce22601d4c605f", #Red Hat Enterprise Linux 8
    "Ansible-worker-3-amazon" = "ami-0ff5003538b60d5ec"  #Amazon Linux 2 AMI
  })

  ami                     = each.value
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  security_groups = [aws_security_group.my_security_group.name]
  depends_on      = [aws_security_group.my_security_group] #ensures sg is created before ec2


  root_block_device {
    volume_size = var.aws_root_storage_size_default # conditional to set root volume size based on env
    volume_type = "gp3"
  }

  tags = {
    Name         = each.key
    Organization = "Terraform"
    Environment  = var.env
  }

}