variable "description" {
    type        = string 
    description = "Description for the custom action target"
    default     = "This is custom action sends selected findings to chat"
} 

variable "name" {
    type        = string 
    description = "The description for the custom action target"
    default     = ""
}

variable "identifier" {
    type        = string 
    description = "The ID for the custom action target"
    default     = ""
}

variable "linking_mode" {
    type        = string 
    description = "Indicate whether to aggregate findings from all of the available regions or from a specified list. The options are ALL_REGIONS, ALL_REGIONS_EXCEPT_SPECIFIED or SPECIFIED_REGIONS"
    default     = "ALL_REGIONS"
}

variable "specified_region" {
    type        = string 
    description = "List of regions to include or exclude required if linking mode is set to ALL_REGIONS_EXCEPT_SPECIFIED or SPECIFIED_REGIONS"
    default     = ""
}

variable "email" {
    type        = string 
    description = "The email of the member AWS Account"
}

varaible "members" {
    type = list(any)
    default = []
    description = "List of member accounts as [{account_id: '3333', email: 'fokutaaker.com'}, {...}]"
}

variable "invite" {
    type        = string 
    description = "Invite the account to security hub as a member (False when this account is the delegated admin by master account)"
    default     = true
}

variable "master_account_id" {
    type        = string 
    description = "The account ID of the master security hub account whose invitation you are accepting"
}

variable "product_subscription_arns" {
    type        = list(string)
    description = "The ARN of the product that generates findings that you want to import into Security Hub"
    default     = []
}

variable "standard_subscription_arns" {
    type        = list(string)
    description = "The list of standard ARNs to subscribe to. Currently available are AWS Foundational Security Best Practices, CIS AWS Foundations and PCI DSS"
    default     = []
}

# List of arns to subscribe to when builing the module in in component collections
# arn:aws:securityhub:us-east-1::standards/aws-foundational-security-best-practices/v/1.0.0
# arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0
# arn:aws:securityhub:us-east-1::standards/pci-dss/v/3.2.1

# Notification variables 
variable "alarm_email" {
    type = string 
    default = ""
    description = "Enable email notification"
}

variable "slack_alarm_notification" {
    type = string 
    default = ""
    description = "Enable slack notification to endpoint passed"
}



# variable "account_id" {
#     type        = string 
#     description = "The ID of the member AWS Account"
#     default     = ""
# }