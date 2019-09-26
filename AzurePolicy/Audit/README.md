Download the "Deploy-AZ-Audit-Policy.ps1" to your local workstation

1. Update the section paramter "PolicyParameters" to relfect the tags your looking to audit for in a text editor
2. Run the "Deploy-AZ-Audit-Policy.ps1" 

You can validate the policy was created by running the command below (It will check for the policy in your current subscription).  

Get-AzPolicyAssignment -Name "Audit Resource Tags"