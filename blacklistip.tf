resource "aws_waf_ipset" "blacklist_ipset" {
  name = "blacklist_ip_set"

  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.7.0/24"
  }
}
