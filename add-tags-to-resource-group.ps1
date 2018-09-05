# RvdT - 05-09-2018
# Add / replace all tags within a specific resource group name

$resourceGroupName = 'define resource group name'

$azureRGInfo = Get-AzureRmResourceGroup -Name $resourceGroupName

foreach ($item in $azureRGInfo) 
{
get-AzureRmResource -ResourceGroupName $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}