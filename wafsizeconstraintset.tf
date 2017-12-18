resource "aws_waf_size_constraint_set" "size_constraint_set" {
  # lets say headers uses 1k, any specific headers that are 512 bytes is really quite large.
  name = "size_constraint_set"
  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "8192"
    # CF only forwards the first 8192 bytes for inspection
    field_to_match {
      type = "BODY"
    }
  }
  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "50"
    # because 50 bytes for strange longer named custom methods?
    field_to_match {
      type = "METHOD"
    }
  }
  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "512"
    field_to_match {
      type = "URI"
    }
  }
  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "512"
    field_to_match {
      type = "QUERY_STRING"
    }
  }
  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "512"
    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "512"
    field_to_match {
      type = "HEADER"
      data = "Referer"
    }
  }
  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "512"
    field_to_match {
      type = "HEADER"
      data = "Cookie"
    }
  }
  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "512"
    field_to_match {
      type = "HEADER"
      data = "X-Forwarded-For"
    }
  }
}
