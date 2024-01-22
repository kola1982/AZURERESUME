@description('Specifies the location for resources.')
param location2 string = 'eastus'

@minLength(3)
@maxLength(24)
@description('Provide a name for the storage account. Use only lower case letters and numbers. The name must be unique across Azure.')
param storageAccountName string = 'store${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-06-01' = {
  name: 'lake'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}
resource exampleStorage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location2
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
