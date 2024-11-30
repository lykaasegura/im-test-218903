# Copyright 2022 Google.
# This software is provided as-is, without warranty or representation for any use or purpose.
# Your use of it is subject to your agreement with Google.

output "db_connection_name" {
  value = google_sql_database_instance.db1.connection_name
}
output "db_name" {
  value = google_sql_database_instance.db1.name
}
output "db_user" {
  value = google_sql_user.user1.name
}
output "db_private_ip" {
  value = google_sql_database_instance.db1.private_ip_address
}
output "db_public_ip" {
  value = google_sql_database_instance.db1.public_ip_address
}
