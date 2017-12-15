resource "aws_waf_sql_injection_match_set" "sql_injection_match_set_cmd_line" {
  name = "sql_injection_match_set_cmd_line"
  # CMD_LINE
  sql_injection_match_tuples {
    text_transformation = "CMD_LINE"
    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "CMD_LINE"
    field_to_match {
      type = "HEADER"
      data = "Referer"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "CMD_LINE"
    field_to_match {
      type = "HEADER"
      data = "X-Forwarded-For"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "CMD_LINE"
    field_to_match {
      type = "HEADER"
      data = "Cookie"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "CMD_LINE"
    field_to_match {
      type = "METHOD"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "CMD_LINE"
    field_to_match {
      type = "QUERY_STRING"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "CMD_LINE"
    field_to_match {
      type = "URI"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "CMD_LINE"
    field_to_match {
      type = "BODY"
    }
  }
}
