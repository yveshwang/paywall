resource "aws_waf_rule" "waf_sqlinjection_rule_compress_whitespace" {
  depends_on  = ["aws_waf_sql_injection_match_set.sql_injection_match_set_compress_whitespace"]
  name        = "sqlinjectionurlcompresswhitespace"
  metric_name = "sqlinjectionurlcompresswhitespace"

  predicates {
    data_id = "${aws_waf_sql_injection_match_set.sql_injection_match_set_compress_whitespace.id}"
    negated = false
    type    = "SqlInjectionMatch"
  }
}
