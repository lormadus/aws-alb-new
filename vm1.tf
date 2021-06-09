resource "aws_instance" "vm1" {
  ami               = var.amazon_linux
  availability_zone = "us-west-1a"
  instance_type     = "t2.nano"
  key_name          = var.dev_keyname
  vpc_security_group_ids = [
    aws_security_group.vm-sg.id,
    aws_default_security_group.dev_default.id
  ]

  subnet_id                   = aws_subnet.public_1a.id
  associate_public_ip_address = true

user_data = <<USER_DATA
#!/bin/bash
yum update -y
#### ALB만 설정하는 경우 아래 사용
yum install httpd -y
/bin/systemctl start httpd.service

echo "<html>" > /var/www/html/index.html   ## 리다이렉션 반드시 한개로
echo "Hello World from $(hostname -f)" >> /var/www/html/index.html
echo "</html>" >> /var/www/html/index.html

USER_DATA


  tags = {
    Name = "user03-linux-vm1"
  }
}
