resource "aws_waf_rule" "waf_xss_rule_none" {
  depends_on  = ["aws_waf_xss_match_set.xss_match_set_none"]
  name        = "xssurlnone"
  metric_name = "xssurlnone"

  predicates {
    data_id = "${aws_waf_xss_match_set.xss_match_set_none.id}"
    negated = false
    type    = "XssMatch"
  }
}
