variable "cloudflare_api_token" {
  description = "The Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "zone_id" {
  default = "d2f5ecb818f42add727f173b11c60801"
}

variable "account_id" {
  default = "9a3f8c6966b6fed7c12a60d4c1e7a7af"
}

variable "domain" {
  default = "bartoutofthebox.com"
}
