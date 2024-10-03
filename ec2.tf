resource "aws_instance" "bastion" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id = aws_subnet.public.id
  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "app" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_3000port.id]
  subnet_id = aws_subnet.private.id
  tags = {
    Name = "app"
  }
}