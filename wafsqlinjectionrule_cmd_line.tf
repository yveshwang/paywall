resource "aws_waf_rule" "waf_sqlinjection_rule_cmd_line" {
  depends_on  = ["aws_waf_sql_injection_match_set.sql_injection_match_set_cmd_line"]
  name        = "sqlinjectionurlcmdline"
  metric_name = "sqlinjectionurlcmdline"

  predicates {
    data_id = "${aws_waf_sql_injection_match_set.sql_injection_match_set_cmd_line.id}"
    negated = false
    type    = "SqlInjectionMatch"
  }
}
