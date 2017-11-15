# yh
# 13.11.2018


# following the example on by modax
# https://github.com/statoilfuelretail/gpe-deploy-trx/blob/master/modules/roll_maindb_lambda/main.tf#L36
# West coast region
provider "aws" {
  alias  = "lambda"
  shared_credentials_file = "~/.aws/config"
  region = "us-east-1"
}

variable "function_name" { default = "cf-edgeside-lambda" }

data "aws_iam_policy_document" "lambda_assume" {
  statement {
    sid = "lambda"
    actions = [ "sts:AssumeRole" ]
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com",
        "edgelambda.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "lambda_infra" {
  statement {
    sid = "logs"
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }

  # FIXME: not sure if this is needed
  statement {
   sid = "eni"
   effect = "Allow",
   actions = [
     "ec2:CreateNetworkInterface",
     "ec2:DescribeNetworkInterfaces",
     "ec2:DetachNetworkInterface",
     "ec2:DeleteNetworkInterface"
   ],
   resources = [ "*" ]
  }
}

resource "aws_iam_role" "lambda" {
  name = "${var.function_name}-lambda-role"
  assume_role_policy = "${data.aws_iam_policy_document.lambda_assume.json}"
}

resource "aws_iam_role_policy" "lambda_infra" {
  name = "${var.function_name}-lambda-policy"
  role = "${aws_iam_role.lambda.id}"
  policy = "${data.aws_iam_policy_document.lambda_infra.json}"
}

resource "aws_lambda_function" "edgesidelambda" {
  provider = "aws.lambda"
  description = "lambda at edge"
  function_name = "${var.function_name}"
  role = "${aws_iam_role.lambda.arn}"
  handler = "index.handler"
  runtime = "nodejs6.10"
  memory_size = "128"
  publish = true
  # FIXME: should not be hardcoded.
  # filename = "${replace(path.module, "/^\\Q${path.root}/\\E/", "")}/lambda.zip"
  # source_code_hash = "${base64sha256(file("${path.module}/lambda.zip"))}"
  filename = "lambda.zip"
  source_code_hash = "${base64sha256(file("lambda.zip"))}"

/*  vpc_config {
    subnet_ids = [ "${aws_subnet.paywall-subnet.id}" ]
    security_group_ids = [ "${aws_security_group.allow_all.id}" ]
  }
*/
  depends_on = [
    "aws_iam_role_policy.lambda_infra"
  ]
}

output "lambda_file_hash" {
    value = "${aws_lambda_function.edgesidelambda.source_code_hash}"
}

output "lambda_arn" {
  value = "${aws_lambda_function.edgesidelambda.qualified_arn}"
}
