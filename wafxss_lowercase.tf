resource "aws_waf_xss_match_set" "xss_match_set_lowercase" {
  name = "xss_match_set_lowercase"
  # LOWERCASE
  xss_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  xss_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "HEADER"
      data = "Referer"
    }
  }
  xss_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "HEADER"
      data = "X-Forwarded-For"
    }
  }
  xss_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "HEADER"
      data = "Cookie"
    }
  }
  xss_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "METHOD"
    }
  }
  xss_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "QUERY_STRING"
    }
  }
  xss_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "URI"
    }
  }
  xss_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "BODY"
    }
  }
}
