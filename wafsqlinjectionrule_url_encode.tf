resource "aws_waf_rule" "waf_sqlinjection_rule_url_encode" {
  depends_on  = ["aws_waf_sql_injection_match_set.sql_injection_match_set_url_decode"]
  name        = "sqlinjectionurlencode"
  metric_name = "sqlinjectionurlencode"

  predicates {
    data_id = "${aws_waf_sql_injection_match_set.sql_injection_match_set_url_decode.id}"
    negated = false
    type    = "SqlInjectionMatch"
  }
}
