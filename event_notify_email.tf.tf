resource "aws_cloudwatch_event_target" "sns_notification" {
    count = var.alarm_email != "" ? 1 : 0
    rule  = aws_cloudwatch_event_rule.security_hub.name 
    target_id = "securityhub-to-sns"
    arn       = aws_sns_topic.security_hub[0].arn
}

resource "aws_sns_topic" "security_hub" {
    count = var.alarm_email != "" ? 1 : 0
    name_prefix = "securityhub-"
}

resource "aws_sns_topic_policy" "policy" {
    count = var.alarm_email != "" ? 1 : 0
    arn   = aws_sns_topic.security_hub[0].arn
    policy = data.aws_iam_policy_document.sns_topic_policy[0].json
  
}

data "aws_iam_policy_document" "sns_topic_policy" {
    count = var.alarm_email != "" ? 1 : 0
    statement {
      effect = "Allow"
      actions = ["SNS:Publish"]
      principals {
          type = "Service"
          identifiers = ["events.amazonaws.com"]
      }
      resources = [aws_sns_topic.security_hub[0].arn]
    }
}

resource "aws_sns_topic_subscription" "email_alert" {
    count = var.alarm_email != "" ? 1 : 0
    topic_arn = aws_sns_topic.security_hub[0].topic_arn
    protocol = "email"
    endpoint = try(var.alarm_email, "")
}