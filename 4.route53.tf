data "aws_route53_zone" "dns_zone" {
    name = var.dns_name
}

resource "aws_route53_record" "dev_record" {
    count = var.profile == "dev" ? 1 : 0 
    zone_id = data.aws_route53_zone.dns_zone.zone_id
    name    = "dev1"
    type    = "A"
    ttl     = 300

    records = [
        aws_instance.web-1.public_ip,
    ]
}

resource "aws_route53_record" "prod_record" {
    provider        = aws.dns
    count = var.profile == "prod" ? 1 : 0 
    zone_id = data.aws_route53_zone.dns_zone.zone_id
    name    = "prod1"
    type    = "A"
    ttl     = 300

    records = [
        aws_instance.web-1.public_ip,
    ]
}