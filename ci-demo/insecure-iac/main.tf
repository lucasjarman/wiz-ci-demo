# DELIBERATELY INSECURE, NEVER PLANNED OR APPLIED. A fixture so Wiz Code's IaC scanning has findings.
# It sits outside terraform/ on purpose: the PR guard and terraform.yml only look under terraform/.
# Do not "fix" it (AGENTS.md, Intentional findings).

terraform {
  required_providers {
    google = { source = "hashicorp/google" }
  }
}

resource "google_storage_bucket" "public_exports" {
  name                        = "ci-demo-public-exports"
  location                    = "US"
  uniform_bucket_level_access = false
  force_destroy               = true

  versioning {
    enabled = false
  }
}

resource "google_storage_bucket_iam_member" "public_read" {
  bucket = google_storage_bucket.public_exports.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

resource "google_compute_firewall" "admin_ports_from_anywhere" {
  name    = "ci-demo-admin-from-anywhere"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_sql_database_instance" "open_db" {
  name                = "ci-demo-open-db"
  database_version    = "POSTGRES_15"
  deletion_protection = false

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled = true
      ssl_mode     = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"

      authorized_networks {
        name  = "everyone"
        value = "0.0.0.0/0"
      }
    }
  }
}
