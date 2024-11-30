# Copyright 2022 Google.
# This software is provided as-is, without warranty or representation for any use or purpose.
# Your use of it is subject to your agreement with Google.

output "db_connection_name" {
  value = google_sql_database_instance.db1.connection_name
}

output "db_private_key" {
  value = google_secret_manager_secret.private_key.secret_id
}

output "db_client_cert" {
  value = google_secret_manager_secret.client_cert.secret_id
}

output "db_ca_cert" {
  value = google_secret_manager_secret.server_ca_cert.secret_id
}

output "db_name" {
  value = google_sql_database_instance.db1.name
}
output "db_user" {
  value = google_sql_user.user1.name
}
output "dbuser_secret" {
  value = google_secret_manager_secret.dbuser_secret.secret_id
}
output "db_private_ip" {
  value = google_sql_database_instance.db1.private_ip_address
}
output "db_public_ip" {
  value = google_sql_database_instance.db1.public_ip_address
}
output "db_connection_url" {
  value = google_secret_manager_secret.db_connection_url.secret_id
}

output "db_service_account_email" {
  value = google_sql_database_instance.db1.service_account_email_address
}
