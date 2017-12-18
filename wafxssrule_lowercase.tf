resource "aws_waf_rule" "waf_xss_rule_lowercase" {
  depends_on  = ["aws_waf_xss_match_set.xss_match_set_lowercase"]
  name        = "xssurllowercase"
  metric_name = "xssurllowercase"

  predicates {
    data_id = "${aws_waf_xss_match_set.xss_match_set_lowercase.id}"
    negated = false
    type    = "XssMatch"
  }
}
