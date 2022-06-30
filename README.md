<!-- BEGIN_TF_DOCS -->
# Create Accessory Records for FreeIPA instance

This module allows quickly and efficiently create all the accessory records
required to have FreeIPA function properly.

The list of records comes from the [official Red Hat IdM Guide](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/installing_identity_management/installing-an-ipa-server-without-integrated-dns_installing-identity-management#ref_idm-dns-records-for-external-dns-systems_installing-an-ipa-server-without-integrated-dns).

## Examples

```hcl
resource "aws_route53_zone" "public" {
  name = "example.com"
}

resource "aws_route53_zone" "private" {
  name = "example.com"

  vpc {
    vpc_id = aws_vpc.example.id
  }
}

module "route53_freeipa_recordset" {
  source  = "CogDisResLab/route53-freeipa-recordset/aws"
  version = "0.9.0"


  base_domain  = "example.com"
  subdomain    = "idp"
  private_zone = aws_route53_zone.private.id
  public_zone  = aws_route53_zone.public.id

}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0, < 5.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_domain"></a> [base\_domain](#input\_base\_domain) | Domain for the idp server | `string` | n/a | yes |
| <a name="input_private_zone"></a> [private\_zone](#input\_private\_zone) | The zone with the private dns records | `string` | n/a | yes |
| <a name="input_public_zone"></a> [public\_zone](#input\_public\_zone) | The zone with the public dns records | `string` | n/a | yes |
| <a name="input_subdomain"></a> [subdomain](#input\_subdomain) | Subdomain where the IDP server resides | `string` | `"idp"` | no |

## Outputs

No outputs.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.kerberos_records_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.kerberos_records_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.kerberos_txt_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.kerberos_txt_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.kpasswd_records_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.kpasswd_records_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ldap_record_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ldap_record_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ntp_record_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ntp_record_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## License

This project is licensed under the GNU General Public License version 3 (GPLv3).
<!-- END_TF_DOCS -->
