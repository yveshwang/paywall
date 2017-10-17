resource "aws_cloudfront_distribution" "cloudfront_paywall" {
  origin {
    domain_name = "${aws_route53_record.paywall-www.fqdn}"
    origin_id   = "cloudfront_paywall_origin"
    custom_origin_config {
      http_port = "80"
      https_port = "443"
      origin_protocol_policy = "match-viewer"
      origin_ssl_protocols = ["TLSv1.1"]
    }
  }
  # TODO: ensure cloudformation is setup first. ths id is hardcoded for now.
  # the quicker fix woudl be to use terraform to call cloudformation and obtain this id as output.
  # the real fix would ge to not use cloudformation at all.
  web_acl_id = "02e048b3-803f-4d16-87de-4a7a5f08be2e"
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "paywall CDN - created via terraform."
  aliases = ["cloudfront.test.gneis.io"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "cloudfront_paywall_origin"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["DK", "NO"]
    }
  }

  tags {
    Environment = "muck around"
  }

  viewer_certificate {
    # iam needs to be in n. virginia for cloud front to work
    acm_certificate_arn = "arn:aws:acm:us-east-1:769910020948:certificate/5c25b3b6-d116-45d8-8274-d03076aa539e"
    minimum_protocol_version = "TLSv1"
    ssl_support_method = "sni-only"
  }
}

resource "aws_route53_record" "cloudfront-www" {
  zone_id = "ZQVDZWEFRYX0Q"
  name    = "cloudfront"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_cloudfront_distribution.cloudfront_paywall.domain_name}"]
}

output "cnd_pub_aws_dns" {
  value = "${aws_cloudfront_distribution.cloudfront_paywall.domain_name}"
}
output "cnd_pub_dns" {
  value = "${aws_route53_record.cloudfront-www.fqdn}"
}
