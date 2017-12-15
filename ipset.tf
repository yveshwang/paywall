resource "aws_waf_ipset" "private_ipset" {
  name = "private_ipset"
  # 15.12.2017
  # note that the largest range that the AWS ipset in matching is basd on the largest IANA block allocation
  # note also i got a list of none assigned public IPs from here
  # https://superuser.com/questions/1053845/what-are-the-valid-public-ip-address-ranges
  # not sure how good it is.
  # AWS WAF supports /8, /16, /24, and /32 IP address ranges for IPv4,
  # and /24, /32, /48, /56, /64 and /128 for IPv6.
  ip_set_descriptors {
    type  = "IPV4"
    value = "0.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "10.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.64.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.65.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.66.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.67.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.68.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.69.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.70.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.71.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.72.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.73.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.74.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.75.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.76.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.77.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.78.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.79.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.80.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.81.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.82.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.83.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.84.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.85.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.86.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.87.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.88.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.89.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.90.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.91.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.92.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.93.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.94.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.95.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.96.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.97.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.98.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.99.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.100.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.101.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.102.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.103.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.104.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.105.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.106.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.107.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.108.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.109.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.110.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.111.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.112.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.113.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.114.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.115.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.116.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.117.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.118.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.119.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.120.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.121.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.122.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.123.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.124.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.125.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.126.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "100.127.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "127.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "169.254.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.16.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.17.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.18.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.19.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.20.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.21.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.22.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.23.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.24.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.25.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.26.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.27.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.28.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.29.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.30.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "172.31.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.0/24"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.0/32"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.1/32"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.2/32"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.3/32"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.4/32"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.5/32"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.6/32"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.7/32"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.8/32"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.9/32"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.170/32"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.0.171/32"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.0.2.0/24"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.31.196.0/24"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.52.193.0/24"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.88.99.0/24"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.168.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "192.175.48.0/24"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "198.18.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "198.19.0.0/16"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "198.51.100.0/24"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "203.0.113.0/24"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "224.0.0.0/24"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "239.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "240.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "241.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "242.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "243.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "244.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "245.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "246.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "247.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "248.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "249.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "250.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "251.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "252.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "253.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "254.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "255.0.0.0/8"
  }
  ip_set_descriptors {
    type  = "IPV4"
    value = "255.255.255.255/32"
  }
}
