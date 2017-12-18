resource "aws_waf_rule" "waf_xss_rule_compress_whitespace" {
  depends_on  = ["aws_waf_xss_match_set.xss_match_set_compress_whitespace"]
  name        = "xssurlcompresswhitespace"
  metric_name = "xssurlcompresswhitespace"

  predicates {
    data_id = "${aws_waf_xss_match_set.xss_match_set_compress_whitespace.id}"
    negated = false
    type    = "XssMatch"
  }
}
