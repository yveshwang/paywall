
resource "aws_waf_rule" "waf_blacklist_ip_rule" {
  depends_on  = ["aws_waf_ipset.blacklist_ipset"]
  name        = "ipblacklist"
  metric_name = "ipblacklist"

  predicates {
    data_id = "${aws_waf_ipset.blacklist_ipset.id}"
    negated = false
    type    = "IPMatch"
  }
}
