resource "aws_waf_ipset" "whitelist_ipset" {
  name = "whitelist_ip_set"

  ip_set_descriptors {
    # for testing only
    type  = "IPV4"
    value = "62.92.58.150/32"
  }
}
