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
  private_zone = aws_route53_zone.private
  public_zone  = aws_route53_zone.public

}
