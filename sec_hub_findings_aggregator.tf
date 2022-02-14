resource "aws_securityhub_finding_aggregator" "main" {
    linking_mode     = var.linking_mode 
    specified_region = var.specified_region 

    depends_on       = [aws_securityhub_account.main]
}