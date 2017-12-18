resource "aws_waf_rule" "waf_sqlinjection_rule_html_entity_encoded" {
  depends_on  = ["aws_waf_sql_injection_match_set.sql_injection_match_set_html_entity_encoded"]
  name        = "sqlinjectionurlhtmlentityencoded"
  metric_name = "sqlinjectionurlhtmlentityencoded"

  predicates {
    data_id = "${aws_waf_sql_injection_match_set.sql_injection_match_set_html_entity_encoded.id}"
    negated = false
    type    = "SqlInjectionMatch"
  }
}
