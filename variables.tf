# Copyright 2022 Google.
# This software is provided as-is, without warranty or representation for any use or purpose.
# Your use of it is subject to your agreement with Google.

variable "region" {
  type = string
  default = "us-central1"
}

variable "db_name" {
  type        = string
  default 	  = "im_db"
}


variable "network_name" {
  type = string
  default = "default"
}

variable "project_id" {
  type        = string
  default     = "g4gfishfood1"
}

variable "database_version" {
  type        = string
  default     = "POSTGRES_15"
  description = "type of database"
}

variable "app_name" {
  type        = string
  description = "app name"
  default = "im_app"
}

variable "db_tier" {
  type        = string
  default     = "db-f1-micro"
  description = "tier of database"
}

variable "sql_public_ip" {
  type        = bool
  default     = false
  description = "enable public ip on cloud sql"
}

variable "enable_ssl" {
  type        = bool
  default     = true
  description = "enable ssl?"
}
