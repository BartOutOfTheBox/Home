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

resource "cloudflare_dns_record" "github_verification" {
  zone_id = var.zone_id
  name    = "_github-pages-challenge-BartOutOfTheBox.bartoutofthebox.com"
  content = "\"1591e97dd25716813d1d84eae6b2da\""
  type    = "TXT"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "zoho_mx1" {
  zone_id = var.zone_id
  name    = "@"
  content = "mx.zoho.eu"
  type    = "MX"
  priority = 10
  proxied = false
  ttl     = 60
}

resource "cloudflare_dns_record" "zoho_mx2" {
  zone_id = var.zone_id
  name    = "@"
  content = "mx2.zoho.eu"
  type    = "MX"
  priority = 20
  proxied = false
  ttl     = 60
}

resource "cloudflare_dns_record" "zoho_mx3" {
  zone_id = var.zone_id
  name    = "@"
  content = "mx3.zoho.eu"
  type    = "MX"
  priority = 30
  proxied = false
  ttl     = 60
}

resource "cloudflare_dns_record" "zoho_SPF" {
  zone_id = var.zone_id
  name    = "@"
  content = "\"v=spf1 include:zohomail.eu ~all\""
  type    = "TXT"
  proxied = false
  ttl     = 60
}

resource "cloudflare_dns_record" "zoho_DKIM" {
  zone_id = var.zone_id
  name    = "zmail._domainkey"
  content = "\"v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCiYBjAjEiW4sAUjdrrjPI8uhZJHf6McQM/dQlfn3Ka/5YvJVs8i4whwyuGz9bn21hq4rGRkzfDX7krpYbkcR6Akvtr/blrE7zhJKFdUUkvjzpwfvdS16K70kRAWUdZCkKoYgSAyWdtaM/CFNKDqJ2GaLs02RwhESeDDmnKpYbi7QIDAQAB\""
  type    = "TXT"
  proxied = false
  ttl     = 60
}

resource "cloudflare_dns_record" "zoho_verification" {
  zone_id = var.zone_id
  name    = "@"
  content = "\"zoho-verification=zb38388977.zmverify.zoho.eu\""
  type    = "TXT"
  proxied = false
  ttl     = 1
}
