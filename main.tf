provider "cloudflare" {
  version = "~> 1.9"
  email = "$(CF_EMAIL)"
  token = "$(CLOUDFLARE_TOKEN)"
}

resource "cloudflare_worker_script" "worker" {
  zone    = "$(CF_ZONE)"
  content = "${file($(CF_WORKER))}"
}