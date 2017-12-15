resource "aws_waf_rate_based_rule" "wafrule" {
  depends_on  = ["aws_waf_ipset.blacklist_ipset"]
  name        = "ratelimiting"
  metric_name = "ratelimiting"

  rate_key = "IP"
  rate_limit = 2000

  predicates {
    data_id = "${aws_waf_ipset.blacklist_ipset.id}"
    negated = false
    type    = "IPMatch"
  }
}
