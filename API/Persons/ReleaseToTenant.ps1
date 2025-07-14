function Exos.API.Persons.ReleaseToTenant {
  <#
.SYNOPSIS
  Release a person to another tenant.

.DESCRIPTION
  Release the specified person to the specified tenant.

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to release to another tenant.

.PARAMETER TenantId
  REQUIRED. The unique identifier of the tenant to release the specified person to.

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: GET /persons/{personId}/releaseToTenant{tenantId}

  Required Access Right: "API_SDM_PersonReleaseToTenant"

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
    | 400140     | The tenant cannot be found                                                  | 404              |
    | 400141     | The person is already released to this tenant                               | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [Parameter(Mandatory = $true)]
    [string]$TenantId,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/releaseToTenant/$TenantId"

  $response = Invoke-ExosApi -Method POST -Uri $url

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}