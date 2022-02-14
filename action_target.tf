# custom actions on findings and insights in 
# requires and ID description and Name
# security hub to trigger target actions in amazon cloudwatch event 

resource "aws_securityhub_action_target" main {
    depends_on  = [aws_securityhub_account.main]
    name        = var.name 
    identifier  = var.identifier 
    description = var.description
}