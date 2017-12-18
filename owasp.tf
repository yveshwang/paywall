# yh
# 14.12.2018
# BUG: there is an issue with multiple rule in terraform not being synced.
# see https://github.com/terraform-providers/terraform-provider-aws/issues/534
resource "aws_waf_web_acl" "owasp_acl" {
  depends_on  = [ "aws_waf_ipset.blacklist_ipset",
                  "aws_waf_rule.waf_blacklist_ip_rule",
                  "aws_waf_ipset.private_ipset",
                  "aws_waf_rate_based_rule.rate_limiting_rule",
                  "aws_waf_rule.waf_sqlinjection_rule_html_entity_encoded",
                  "aws_waf_rule.waf_sqlinjection_rule_none",
                  "aws_waf_rule.waf_sqlinjection_rule_url_encode",
                  "aws_waf_rule.waf_xss_rule_html_entity_encoded",
                  "aws_waf_rule.waf_xss_rule_none",
                  "aws_waf_rule.waf_xss_rule_url_encode",
                  "aws_waf_rule.waf_size_constraint_rule"
                ]
  name        = "owaspacl"
  metric_name = "owaspacl"

  default_action {
    type = "ALLOW"
  }

  rules {
    action {
      type = "BLOCK"
    }
    priority = 1
    rule_id  = "${aws_waf_rule.waf_blacklist_ip_rule.id}"
    type     = "REGULAR"
  }
  rules {
    action {
      type = "BLOCK"
    }
    priority = 2
    rule_id  = "${aws_waf_rate_based_rule.rate_limiting_rule.id}"
    type     = "RATE_BASED"
  }
  rules {
    action {
      type = "BLOCK"
    }
    priority = 3
    rule_id  = "${aws_waf_rule.waf_sqlinjection_rule_html_entity_encoded.id}"
    type     = "REGULAR"
  }
  rules {
    action {
      type = "BLOCK"
    }
    priority = 4
    rule_id  = "${aws_waf_rule.waf_sqlinjection_rule_none.id}"
    type     = "REGULAR"
  }
  rules {
    action {
      type = "BLOCK"
    }
    priority = 5
    rule_id  = "${aws_waf_rule.waf_sqlinjection_rule_url_encode.id}"
    type     = "REGULAR"
  }
  rules {
    action {
      type = "BLOCK"
    }
    priority = 6
    rule_id  = "${aws_waf_rule.waf_xss_rule_html_entity_encoded.id}"
    type     = "REGULAR"
  }
  rules {
    action {
      type = "BLOCK"
    }
    priority = 7
    rule_id  = "${aws_waf_rule.waf_xss_rule_none.id}"
    type     = "REGULAR"
  }
  rules {
    action {
      type = "BLOCK"
    }
    priority = 8
    rule_id  = "${aws_waf_rule.waf_xss_rule_url_encode.id}"
    type     = "REGULAR"
  }
  rules {
    action {
      type = "BLOCK"
    }
    priority = 9
    rule_id  = "${aws_waf_rule.waf_size_constraint_rule.id}"
    type     = "REGULAR"
  }
}
