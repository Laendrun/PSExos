function Exos.API.Persons.UnassignBadge {
  <#
.SYNOPSIS
  Un-assigns a badge from the person.

.DESCRIPTION
  Un-assigns the badge specified in the body from the specified user.

.PARAMETER PersonId
  REQUIRED. The unique identifier of the user to un-assign the badge from.

.PARAMETER BadgeName
  REQUIRED. The name of the badge to un-assign from the user.

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/unassignBadge

  Required Access Right: ["API_SDM_EmployeeUnassignBadge","API_VM_VisitorUnassignBadge","API_CM_ContractorUnassignBadge"]

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
    | 400029     | One or more badges depend on the given badge                                | 400              |
    | 400068     | Key un-assignement could not be made, key is not assigned to the person     | 400              |
    | 400105     | Manipulation on sap media is not allowed                                    | 400              |
    | 400147     | The operation is not supported for mobile access media                      | 400              |
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

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/unassignBadge"

  $Body = @{
    "BadgeName" = $BadgeName
  }

  $response = Invoke-ExosApi -Method POST -Uri $url -Body $Body

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}