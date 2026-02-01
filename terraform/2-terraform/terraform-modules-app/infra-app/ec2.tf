resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("terra-key-ec2.pub")

  tags = {
    Name        = "${var.env}-infra-app-key"
    Environment = var.env
  }
}

# vpc and security group
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-app-sg"
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
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Application access from anywhere"
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
    Name = "${var.env}-infra-app-sg"
  }
}

resource "aws_instance" "ec2-myInstance-1" {
  count                  = var.instance_count
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  security_groups = [aws_security_group.my_security_group.name]
  depends_on      = [aws_security_group.my_security_group] #ensures sg is created before ec2


  root_block_device {
    volume_size = var.env == "prod" ? 20 : 10 # conditional to set root volume size based on env
    volume_type = "gp3"
  }

  tags = {
    Name         = "${var.env}-infra-app-ec2"
    Organization = "Terraform"
    Environment  = var.env
  }

}