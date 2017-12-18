resource "aws_waf_rule" "waf_size_constraint_rule" {
  depends_on  = ["aws_waf_size_constraint_set.size_constraint_set"]
  name        = "sizeconstraint"
  metric_name = "sizeconstraint"

  predicates {
    data_id = "${aws_waf_size_constraint_set.size_constraint_set.id}"
    negated = false
    type    = "SizeConstraint"
  }
}
