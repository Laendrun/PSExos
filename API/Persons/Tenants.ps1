function Exos.API.Persons.Tenants {
  <#
.SYNOPSIS
  Gets all tenants for a person

.DESCRIPTION
  Gets all thenants for which the person is released.

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to get the tenants for.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/tenants

  Required Access Right: 	["API_SDM_EmployeeTenantsRead","API_VM_VisitorTenantsRead","API_CM_ContractorTenantsRead"]

  Possible Error Codes:
    | 100000     | Validation Error                                                            | 400              |
    | 100001     | Invalid Length                                                              | 400              |
    | 100005     | Required parameter missing                                                  | 400              |
    | 300001     | Invalid license function                                                    | 403              |
    | 300004     | Missing authorisation                                                       | 403              |
    | 300008     | Unknown API key or Identifier                                               | 401              |
    | 300009     | Missing category(group) authorisation                                       | 403              |
    | 400001     | Person not found                                                            | 404              |
    | 400139     | Function is not allowed because tenant is not base tenant of this person    | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/tenants"

  $response = Invoke-ExosApi -Method GET -Uri $url

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}