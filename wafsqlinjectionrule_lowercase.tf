resource "aws_waf_rule" "waf_sqlinjection_rule_lowercase" {
  depends_on  = ["aws_waf_sql_injection_match_set.sql_injection_match_set_lowercase"]
  name        = "sqlinjectionurllowercase"
  metric_name = "sqlinjectionurllowercase"

  predicates {
    data_id = "${aws_waf_sql_injection_match_set.sql_injection_match_set_lowercase.id}"
    negated = false
    type    = "SqlInjectionMatch"
  }
}
