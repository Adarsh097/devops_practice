resource "local_file" "myfile" {
  content  = "Hello, Terraform! Starting automation."
  filename = "automate.txt"
}



# key pair (login to ec2 using ssh)

resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
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
    Name = "auto-sg"
  }
}

resource "aws_instance" "ec2-myInstance-1" {
  ami             = var.ec2_ami_id
  instance_type   = var.aws_instance_type
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]


  user_data = file("install_nginx.sh") #script to install nginx
  
  root_block_device {
    volume_size = var.aws_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name         = "MyEc2Instance"
    Organization = "Terraform"
  }

}