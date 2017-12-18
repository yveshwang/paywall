resource "aws_waf_rule" "waf_xss_rule_url_encode" {
  depends_on  = ["aws_waf_xss_match_set.xss_match_set_url_decode"]
  name        = "xssurlencode"
  metric_name = "xssurlencode"

  predicates {
    data_id = "${aws_waf_xss_match_set.xss_match_set_url_decode.id}"
    negated = false
    type    = "XssMatch"
  }
}
