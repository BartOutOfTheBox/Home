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

resource "cloudflare_dns_record" "www" {
  zone_id = var.zone_id
  name    = "www"
  content = "bartoutofthebox.github.io"
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

resource "cloudflare_dns_record" "ddns_worker" {
  zone_id = var.zone_id
  name    = "ddns.bartoutofthebox.com"
  content = "unifi-cloudflare-ddns"
  ttl     = 1
  type    = "Worker"
}

resource "cloudflare_dns_record" "wildcard" {
  zone_id = var.zone_id
  name    = "*.bartoutofthebox.com"
  content = "0.0.0.0"   # Placeholder which will be updated dynamically
  type    = "A"
  proxied = false  # Placeholder which can be changed whenever the content is actually filled
  ttl     = 1

  lifecycle {
    ignore_changes = [content, proxied]
  }
}
