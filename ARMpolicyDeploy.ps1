$mysubscription = 
$myresourcegroup = 


login-azurermaccount
Get-AzureRmSubscription
Select-AzureRmSubscription -SubscriptionId $mysubscription


$policy = New-AzureRmPolicyDefinition -Name tags-owner -Description "Policy to set owner tags" -Policy "tags-owner.json"
New-AzureRmPolicyAssignment -Name tags-owner -PolicyDefinition $policy -Scope /subscriptions/$mysubscription/resourceGroups/$myresourcegroup

$policy = New-AzureRmPolicyDefinition -Name tags-costcenter -Description "Policy to set costcenter" -Policy "tags-costcenter.json"
New-AzureRmPolicyAssignment -Name tags-costcenter -PolicyDefinition $policy -Scope /subscriptions/$mysubscription/resourceGroups/$myresourcegroup

$policy = New-AzureRmPolicyDefinition -Name tags-notags -Description "Policy to set costcenter" -Policy "tags-notags.json"
New-AzureRmPolicyAssignment -Name tags-notags -PolicyDefinition $policy -Scope /subscriptions/$mysubscription/resourceGroups/$myresourcegroup