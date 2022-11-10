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
  project_id = "0c1671e0-2f42-4ed2-8799-14f144ecb947"
}

# Partie 1.1.

# Création Instance Serveur sur Scaleway 1

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_volume" "data1" {
  size_in_gb = 10
  type = "b_ssd"
}

resource "scaleway_instance_server" "instance1" {
  name  = "Instance_1_Projet"
  image = "ubuntu_jammy"
  type  = "DEV1-S"
  ip_id = scaleway_instance_ip.public_ip.id
  additional_volume_ids = [ scaleway_instance_volume.data1.id ]
}
# Ajout groupe de sécurité

# Création Instance Base de données sur Scaleway

resource "scaleway_rdb_instance" "bdd1" {
  name              = "BDD_1_Projet"
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

# Partie 1.2.

# Création Instance Serveur sur Scaleway 2

resource "scaleway_instance_ip" "public_ip2" {}

resource "scaleway_instance_volume" "data2" {
  size_in_gb = 10
  type = "b_ssd"
}

resource "scaleway_instance_server" "instance2" {
  name  = "Instance_2_Projet"
  image = "ubuntu_jammy"
  type  = "DEV1-S"
  ip_id = scaleway_instance_ip.public_ip2.id
  additional_volume_ids = [ scaleway_instance_volume.data2.id ]
}
# Ajout groupe de sécurité

# Création Load Balancer sur Scaleway

resource "scaleway_lb_ip" "public_ip3" {
  zone = "fr-par-1"
}

resource "scaleway_lb" "base" {
  name   = "Load_Balancer_1_Projet"
  ip_id  = scaleway_lb_ip.public_ip3.id
  zone   = scaleway_lb_ip.public_ip3.zone
  type   = "LB-S"
}