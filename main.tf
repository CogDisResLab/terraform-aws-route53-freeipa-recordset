locals {
  kerberos_record_names = toset(["_kerberos-master._tcp.${var.base_domain}.",
    "_kerberos._tcp.${var.base_domain}.",
    "_kerberos-master._udp.${var.base_domain}.",
  "_kerberos._udp.${var.base_domain}."])

  kpasswd_record_names = toset(["_kpasswd._tcp.${var.base_domain}.",
  "_kpasswd._udp.${var.base_domain}."])

  ldap_record_names = "_ldap._tcp.${var.base_domain}."

  ntp_record_names = "_ntp._udp.${var.base_domain}."

}

resource "aws_route53_record" "kerberos_txt_public" {
  zone_id = var.public_zone
  name    = "_kerberos.${var.base_domain}."
  type    = "TXT"
  ttl     = "300"
  records = [upper(var.base_domain)]
}

resource "aws_route53_record" "kerberos_txt_private" {
  zone_id = var.private_zone
  name    = "_kerberos.${var.base_domain}."
  type    = "TXT"
  ttl     = "300"
  records = [upper(var.base_domain)]
}

resource "aws_route53_record" "kerberos_records_public" {
  for_each = local.kerberos_record_names

  zone_id = var.public_zone
  name    = each.value
  type    = "SRV"
  ttl     = "300"
  records = ["0 100 88 ${var.subdomain}.${var.base_domain}"]
}

resource "aws_route53_record" "kerberos_records_private" {
  for_each = local.kerberos_record_names

  zone_id = var.private_zone
  name    = each.value
  type    = "SRV"
  ttl     = "300"
  records = ["0 100 88 ${var.subdomain}.${var.base_domain}"]
}

resource "aws_route53_record" "kpasswd_records_public" {
  for_each = local.kpasswd_record_names

  zone_id = var.public_zone
  name    = each.value
  type    = "SRV"
  ttl     = "300"
  records = ["0 100 446 ${var.subdomain}.${var.base_domain}"]
}

resource "aws_route53_record" "kpasswd_records_private" {
  for_each = local.kpasswd_record_names

  zone_id = var.private_zone
  name    = each.value
  type    = "SRV"
  ttl     = "300"
  records = ["0 100 446 ${var.subdomain}.${var.base_domain}"]
}

resource "aws_route53_record" "ldap_record_public" {

  zone_id = var.public_zone
  name    = local.ldap_record_names
  type    = "SRV"
  ttl     = "300"
  records = ["0 100 389 ${var.subdomain}.${var.base_domain}"]
}

resource "aws_route53_record" "ldap_record_private" {

  zone_id = var.private_zone
  name    = local.ldap_record_names
  type    = "SRV"
  ttl     = "300"
  records = ["0 100 389 ${var.subdomain}.${var.base_domain}"]
}

resource "aws_route53_record" "ntp_record_public" {

  zone_id = var.public_zone
  name    = local.ntp_record_names
  type    = "SRV"
  ttl     = "300"
  records = ["0 100 123 ${var.subdomain}.${var.base_domain}"]
}

resource "aws_route53_record" "ntp_record_private" {

  zone_id = var.private_zone
  name    = local.ntp_record_names
  type    = "SRV"
  ttl     = "300"
  records = ["0 100 123 ${var.subdomain}.${var.base_domain}"]
}
