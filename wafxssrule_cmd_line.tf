resource "aws_waf_rule" "waf_xss_rule_cmd_line" {
  depends_on  = ["aws_waf_xss_match_set.xss_match_set_cmd_line"]
  name        = "xssurlcmdline"
  metric_name = "xssurlcmdline"

  predicates {
    data_id = "${aws_waf_xss_match_set.xss_match_set_cmd_line.id}"
    negated = false
    type    = "XssMatch"
  }
}
