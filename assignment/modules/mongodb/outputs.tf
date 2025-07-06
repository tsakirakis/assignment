output "mongodb_instance_ids" {
  value = aws_instance.mongodb[*].id
}
