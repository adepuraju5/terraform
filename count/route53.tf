resource "aws_route53_record" "www" {
    count = 10
    zone_id = var.hosted_zone_id
    #interpolation
    name    = "${var.instance[count.index]}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [aws_instance.example[count.index].private_ip]
}