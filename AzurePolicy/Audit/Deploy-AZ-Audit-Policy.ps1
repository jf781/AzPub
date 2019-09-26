# Creates the Policy Definition
$Definitions = New-AzPolicyDefinition -Name "Audit Resource Tags" `
-Description "Audits all resources to ensure necessary tags are created" `
-Mode Indexed `
-Policy https://raw.githubusercontent.com/jf781/AzPub/master/AzurePolicy/Audit/AZPolicy-Audit-Tag-Name.json `
-Parameter https://raw.githubusercontent.com/jf781/AzPub/master/AzurePolicy/Audit/AZPolicy-Audit-Tag-Name-Parameters.json

# Defines the Required resource tags your auditing
$PolicyParameters = @{tagname1="CostCenter";tagName2="Owner"}

# Defines the current subscription as the scope for the policy
$Sub = "/subscriptions/" + (Get-AzSubscription).SubscriptionId

# Assigns the policy to the current subscription
New-AzPolicyAssignment -Name "Audit Resource Tags" `
-PolicyDefinition $Definitions `
-Description "Checks for the tags defined in the 'Parameters' section and then audits all applicable resources to verify if those tags are present" `
-Scope $Sub `
-PolicyParameterObject $PolicyParameters






