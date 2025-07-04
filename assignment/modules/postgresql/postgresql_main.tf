resource "aws_instance" "postgresql_master" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  tags = merge(var.tags, { Name = "postgresql-master" })

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y postgresql
              sudo systemctl start postgresql
              sudo systemctl enable postgresql
              EOF
}

resource "aws_instance" "postgresql_slave" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  tags = merge(var.tags, { Name = "postgresql-slave" })

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y postgresql
              sudo systemctl start postgresql
              sudo systemctl enable postgresql
              EOF
}
