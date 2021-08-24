provider "grafana" {
  url    = "http://grafana.aws.com"
  auth   = "admin:prom-operator"
  org_id = 1
}

terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 1.7.0"
    }
  }
}


resource "grafana_dashboard" "blackbox-exporter" {
  config_json = file("dashboard-blackbox-exporter.json")
}


resource "grafana_dashboard" "node-exporter-network" {
  config_json = file("dashboard-node-exporter-network.json")
}


