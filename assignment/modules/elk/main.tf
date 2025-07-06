resource "aws_instance" "elk" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  tags = merge(var.tags, { Name = "elk-stack" })

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y docker.io
              sudo docker run -d --name elk -p 5601:5601 -p 9200:9200 -p 5044:5044 sebp/elk
              EOF
}
