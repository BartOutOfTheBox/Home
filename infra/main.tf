module "dns" {
  source = "./dns"
  cloudflare_api_token = var.cloudflare_api_token
}

# Add variable declaration
variable "cloudflare_api_token" {
  description = "The Cloudflare API token"
  type        = string
  sensitive   = true
}