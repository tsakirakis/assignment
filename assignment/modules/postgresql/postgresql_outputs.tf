output "postgresql_master_id" {
  value = aws_instance.postgresql_master.id
}

output "postgresql_slave_id" {
  value = aws_instance.postgresql_slave.id
}
