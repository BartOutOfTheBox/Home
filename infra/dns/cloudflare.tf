terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_dns_record" "root1" {
  zone_id = var.zone_id
  name    = "bartoutofthebox.com"
  content = "185.199.108.153"
  type    = "A"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "root2" {
  zone_id = var.zone_id
  name    = "bartoutofthebox.com"
  content = "185.199.109.153"
  type    = "A"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "root3" {
  zone_id = var.zone_id
  name    = "bartoutofthebox.com"
  content = "185.199.110.153"
  type    = "A"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "root4" {
  zone_id = var.zone_id
  name    = "bartoutofthebox.com"
  content = "185.199.111.153"
  type    = "A"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "rootAAAA1" {
  zone_id = var.zone_id
  name    = "bartoutofthebox.com"
  content = "2606:50c0:8000::153"
  type    = "AAAA"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "rootAAAA2" {
  zone_id = var.zone_id
  name    = "bartoutofthebox.com"
  content = "2606:50c0:8001::153"
  type    = "AAAA"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "rootAAAA3" {
  zone_id = var.zone_id
  name    = "bartoutofthebox.com"
  content = "2606:50c0:8002::153"
  type    = "AAAA"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "rootAAAA4" {
  zone_id = var.zone_id
  name    = "bartoutofthebox.com"
  content = "2606:50c0:8003::153"
  type    = "AAAA"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "www" {
  zone_id = var.zone_id
  name    = "www"
  content = "bartoutofthebox.com"
  type    = "CNAME"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "_domainconnect" {
  zone_id = var.zone_id
  name    = "_domainconnect"
  content = "_domainconnect.gd.domaincontrol.com"
  type    = "CNAME"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_workers_custom_domain" "ddns_worker_custom_domain" {
  zone_id     = var.zone_id
  account_id  = var.account_id
  hostname    = "ddns.bartoutofthebox.com"
  service     = "unifi-cloudflare-ddns"
  environment = "production"
}

resource "cloudflare_dns_record" "wildcard" {
  zone_id = var.zone_id
  name    = "*.bartoutofthebox.com"
  content = "0.0.0.0"   # Placeholder which will be updated dynamically
  type    = "A"
  proxied = false  # Placeholder which can be changed whenever the content is actually filled
  ttl     = 1

  lifecycle {
    ignore_changes = [content]
  }
}
