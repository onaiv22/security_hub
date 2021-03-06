resource "aws_cloudwatch_event_rule" "security_hub" {
    count = var.alarm_email != "" || var.alarm_slack_endpoint != "" ? 1 : 0
    name_prefix = "SecurityHubFindings"
    description = "Captures SecurityHub New Findings"

    event_pattern = <<EOF
{
  "detail-type": [
    "Security Hub Findings - Imported"
  ],
  "source": [
    "aws.securityhub"
  ],
  "detail": {
    "findings": {
      "Severity": {
        "Label": ${jsonencode(var.severity_list)}
      },
      "Workflow": {
        "Status": [
          "NEW"
        ]
      }
    }
  }
}
EOF
}
    