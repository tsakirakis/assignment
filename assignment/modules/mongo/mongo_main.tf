resource "aws_instance" "mongodb" {
  count         = 3
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  tags = merge(var.tags, { Name = "mongodb-${count.index}" })

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y mongodb
              sudo systemctl start mongodb
              sudo systemctl enable mongodb
              EOF
}
