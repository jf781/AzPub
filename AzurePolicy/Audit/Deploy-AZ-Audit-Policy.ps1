# Creates the Policy Definition
$Definitions = New-AzPolicyDefinition -Name "Audit Resource Tags" `
-Description "Audits all resources to ensure necessary tags are created" `
-Mode Indexed `
-Policy /%PathtoFile%/AZPolicy-Audit-Tag-Name.json `
-Parameter /%PathToFile%/AZPolicy-Audit-Tag-Name-Parameters.json

# Defines the Required resource tags your auditing
$PolicyParameters = @{tagname1="CostCenter";tagName2="Owner"}

# Defines the current subscription as the scope for the policy
$Sub = "/subscriptions/" + (Get-AzSubscription).SubscriptionId

# Assigns the policy to the current subscription
New-AzPolicyAssignment -Name "Audit Resource Tags" `
-PolicyDefinition $Definitions `
-Scope $Sub `
-PolicyParameterObject $PolicyParameters






