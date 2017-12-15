resource "aws_waf_rule" "waf_sqlinjection_rule_none" {
  depends_on  = ["aws_waf_sql_injection_match_set.sql_injection_match_set_none"]
  name        = "sqlinjectionurlnone"
  metric_name = "sqlinjectionurlnone"

  predicates {
    data_id = "${aws_waf_sql_injection_match_set.sql_injection_match_set_none.id}"
    negated = false
    type    = "SqlInjectionMatch"
  }
}
