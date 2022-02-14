resource "aws_securityhub_member" "members" {
    for_each = { for member in var.members: member.account_id => member }
    account_id = each.value.account_id 
    email      = each.value.email 
    invite     = var.invite

    depends_on = [aws_securityhub_account.main]
}

# Invite accepter is to be created in other account accepting to be member. An aws account can only
# be associated witha single security hub master . Destroying this resource will
# disassociate the member account from the master account. 


resource "aws_securityhub_invite_accepter" "main" {
    master_id = var.master_account_id # aws_securityhub_member.main.master_id
}