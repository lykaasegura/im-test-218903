# Copyright 2022 Google.
# This software is provided as-is, without warranty or representation for any use or purpose.
# Your use of it is subject to your agreement with Google.

resource "random_pet" "db_suffix" {
  keepers = {
    project_id = var.project_id
  }
}

data "google_compute_network" "private_network" {
  name    = var.network_name
  project = var.project_id
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "google_sql_database_instance" "db1" {
  database_version    = var.database_version
  name                = "${var.app_name}-db-${random_pet.db_suffix.id}"
  deletion_protection = false
  region              = var.region
  project             = random_pet.db_suffix.keepers.project_id
  # it assumed that a private vpc connection has been created.
  settings {
    deletion_protection_enabled = false
    tier = var.db_tier
    ip_configuration {
      ipv4_enabled    = var.sql_public_ip
      private_network = data.google_compute_network.private_network.id
    }

    backup_configuration {
      enabled    = true
      start_time = "22:55"
      point_in_time_recovery_enabled = true

      backup_retention_settings {
        retained_backups = 30
      }
    }
  }

  lifecycle {
    ignore_changes = [
        settings[0].ip_configuration[0]
    ]
  }
}

resource "google_sql_database" "db" {
  project  = var.project_id
  name     = var.db_name
  instance = google_sql_database_instance.db1.id
}

resource "google_sql_user" "user1" {
  project  = var.project_id
  name     = "${var.app_name}-${random_pet.db_suffix.id}"
  instance = google_sql_database_instance.db1.name
  # host     = "%"
  password = random_password.password.result
  depends_on = [
    google_sql_database_instance.db1,
    random_password.password
  ]
}
