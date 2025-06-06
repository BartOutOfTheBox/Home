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

resource "cloudflare_dns_record" "rootA1" {
  zone_id = var.zone_id
  name    = "bartoutofthebox.com"
  content = "185.199.108.153"
  type    = "A"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "rootA2" {
  zone_id = var.zone_id
  name    = "bartoutofthebox.com"
  content = "185.199.109.153"
  type    = "A"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "rootA3" {
  zone_id = var.zone_id
  name    = "bartoutofthebox.com"
  content = "185.199.110.153"
  type    = "A"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "rootA4" {
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
  name    = "www.bartoutofthebox.com"
  content = "bartoutofthebox.github.io"
  type    = "CNAME"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "vpn" {
  zone_id = var.zone_id
  name    = "vpn.bartoutofthebox.com"
  content = "0.0.0.0"   # Placeholder which will be updated dynamically
  type    = "A"
  proxied = false  # Placeholder which can be changed whenever the content is actually filled
  ttl     = 1

  lifecycle {
    ignore_changes = [content]
  }
}

resource "cloudflare_dns_record" "github_verification" {
  zone_id = var.zone_id
  name    = "_github-pages-challenge-BartOutOfTheBox.bartoutofthebox.com"
  content = "\"1591e97dd25716813d1d84eae6b2da\""
  type    = "TXT"
  proxied = false
  ttl     = 1
}
