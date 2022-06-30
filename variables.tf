variable "base_domain" {
  description = "Domain for the idp server"
  type        = string
}

variable "subdomain" {
  description = "Subdomain where the IDP server resides"
  default     = "idp"
  type        = string
}

variable "private_zone" {
  description = "The zone with the private dns records"
  type        = string
}

variable "public_zone" {
  description = "The zone with the public dns records"
  type        = string
}
