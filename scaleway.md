# Provider Scaleway avec Terraform

variable "project_id" {
  type        = string
  default = "391cf766-a0e3-45ce-83bd-xxxxxxxxxxx"
}
terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}
provider "scaleway" {
  zone   = "fr-par-1"
  region = "fr-par"
  access_key = "SCW06N2ZKQN9DTFD8DF4"
  secret_key = "c1b7d567-865d-4c74-9a01-8f78b653e42c"
  project_id = "391cf766-a0e3-45ce-83bd-xxxxxxxxxxxx"
}

# Création Instance Serveur sur Scaleway
resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_server" "main" {
  name  = "Instance 1 - Projet"
  image = "ubuntu_jammy"
  type  = "DEV1-S"
  ip_id = scaleway_instance_ip.public_ip.id
}

resource "scaleway_instance_ip" "public_ip2" {}

resource "scaleway_instance_server2" "main2" {
  name  = "Instance 2 - Projet"
  image = "ubuntu_jammy"
  type  = "DEV1-S"
  ip_id = scaleway_instance_ip.public_ip2.id
}

# Créaton Instance Base de données sur Scaleway

resource "scaleway_rdb_instance" "main" {
  name              = "BDD 1 - Projet"
  node_type         = "db-dev-s"
  engine            = "MySQL-8"
  is_ha_cluster     = false
  disable_backup    = true
  user_name         = "Administrateur"
  password          = "P@ssw0rd!"
  region            = "fr-par"
  volume_type       = "bssd"
  volume_size_in_gb = 10
}

# Création Load Balancer sur Scaleway

resource "scaleway_lb_ip" "main" {
  zone = "fr-par-1"
}

resource "scaleway_lb" "base" {
  ip_id  = scaleway_lb_ip.main.id
  zone   = scaleway_lb_ip.main.zone
  type   = "LB-S"
}