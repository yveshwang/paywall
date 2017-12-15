# yh
# 14.12.2018

resource "aws_waf_web_acl" "owasp_acl" {
  depends_on  = ["aws_waf_ipset.blacklist_ipset", "aws_waf_rule.waf_blacklist_ip_rule"]
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
}
