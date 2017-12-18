resource "aws_waf_rule" "waf_xss_rule_html_entity_encoded" {
  depends_on  = ["aws_waf_xss_match_set.xss_match_set_html_entity_encoded"]
  name        = "xssurlhtmlentityencoded"
  metric_name = "xssurlhtmlentityencoded"

  predicates {
    data_id = "${aws_waf_xss_match_set.xss_match_set_html_entity_encoded.id}"
    negated = false
    type    = "XssMatch"
  }
}
