output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.postgres.endpoint
}

output "db_instance_name" {
  description = "The database name"
  value       = aws_db_instance.postgres.db_name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = aws_db_instance.postgres.username
}

output "db_instance_port" {
  description = "The database port"
  value       = 5432
} 