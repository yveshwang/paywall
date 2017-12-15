resource "aws_waf_rate_based_rule" "rate_limiting_rule" {
  depends_on  = ["aws_waf_ipset.private_ipset"]
  name        = "ratelimiting"
  metric_name = "ratelimiting"

  # max number of request as identified by IP in a given-5-min period
  rate_key = "IP"
  rate_limit = 2000

  predicates {
    data_id = "${aws_waf_ipset.private_ipset.id}"
    # apply to all public IPs except private reserved IPs.
    negated = true
    type    = "IPMatch"
  }
}
