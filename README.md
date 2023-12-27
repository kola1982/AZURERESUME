My terraform resources:

Azure Resource Group: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
Note: simple way to add resource group

Azure Vnet: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
Note: Added my subnet as specified to the vnet and it resources. Resource group and location is tied within variables.

Azure Subnet : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet
Note: did not like the format it could not find the actual resource group and vnet. Had to add subnet and it name under vnet.
