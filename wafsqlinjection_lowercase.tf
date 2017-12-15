resource "aws_waf_sql_injection_match_set" "sql_injection_match_set_lowercase" {
  name = "sql_injection_match_set_lowercase"
  # LOWERCASE
  sql_injection_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "HEADER"
      data = "Referer"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "HEADER"
      data = "X-Forwarded-For"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "HEADER"
      data = "Cookie"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "METHOD"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "QUERY_STRING"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "URI"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "LOWERCASE"
    field_to_match {
      type = "BODY"
    }
  }
}
