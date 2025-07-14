function Exos.API.Persons.UnassignInitializedBadge {
  <#
.SYNOPSIS
  Un-assigns an initialized badge from the person.

.DESCRIPTION
  Un-assigns the initialized badge specified in the body from the specified person.

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to un-assign the badge from.

.PARAMETER BadgeName
  REQUIRED. The name of the initialized badge to un-assign from the person.

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/unassignInitializedBadge

  Required Access Right: 	["API_SDM_EmployeeUnassignInitializedBadge","API_CM_ContractorUnassignInitializedBadge"]

  Possible Error Codes:
    | 100000     | Validation Error                                                            | 400              |
    | 100001     | Invalid Length                                                              | 400              |
    | 100002     | Input object null                                                           | 400              |
    | 100005     | Required parameter missing                                                  | 400              |
    | 100006     | Parameter not allowed                                                       | 400              |
    | 300004     | Missing authorisation                                                       | 403              |
    | 300008     | Unknown API key or Identifier                                               | 401              |
    | 400001     | Person not found                                                            | 404              |
    | 400005     | Media is not assigned to this person                                        | 400              |
    | 400007     | Media not found                                                             | 404              |
    | 400092     | If the current role of the media is not the initialized role                | 400              |
    | 400093     | If the system is not configured for initialized cards                       | 400              |
    | 400146     | Person does not have the correct type                                       | 400              |
    | 500000     | Returned if Rabbit Mq Message could not be published                        | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [Parameter(Mandatory = $true)]
    [string]$BadgeName,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/unassignInitializedBadge"

  $Body = @{
    "BadgeName" = $BadgeName
  }

  $response = Invoke-ExosApi -Method POST -Uri $url -Body $Body

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}