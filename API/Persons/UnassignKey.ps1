function Exos.API.Persons.UnassignKey {
  <#
.SYNOPSIS
  Un-assigns a key from a user
.DESCRIPTION
  Un-assigns the key specified with KeyId from the specified person.

.PARAMETER PersonId
  The unique identifier of the person to un-assign the key from

.PARAMETER KeyId
  - The KeyId that should be un-assigned from the person

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API Response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/unassignKey

  Required Access Right: 	["API_SDM_EmployeeUnassignKey","API_CM_ContractorUnassignKey"]

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
    | 400066     | Key assignement could not be made, key is part of a keyring                 | 400              |
    | 400068     | Key un-assignement could not be made, key is not assigned to the person     | 400              |
    | 400146     | Person does not have the correct type                                       | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [Parameter(Mandatory = $true)]
    [string]$KeyId,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/unassignKey"

  $Body = @{
    "KeyId" = $KeyId
  }

  $response = Invoke-ExosApi -Method POST -Uri $url $Body

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}