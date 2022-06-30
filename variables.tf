variable "base_domain" {
  description = "Domain for the idp server"
}

variable "subdomain" {
  description = "Subdomain where the IDP server resides"
  default     = "idp"
}

variable "private_zone" {
  description = "The zone with the private dns records"
}

variable "public_zone" {
  description = "The zone with the public dns records"
}
