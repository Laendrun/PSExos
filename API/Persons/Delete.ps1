function Exos.API.Persons.Delete {
  <#
.SYNOPSIS
  Deletes a person.

.DESCRIPTION
  Sends a request to delete the specified person.

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to delete.

.PARAMETER CheckOnly
  If true, does not delete. Returns deletion warnings and erros.
  Default: false

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/delete

  Required Access Right: 	["API_SDM_EmployeeDelete","API_CM_ContractorDelete"]

  Possible Error Codes:
    | 100000     | Validation Error                                                             | 400              |
    | 100001     | Invalid Length                                                               | 400              |
    | 100005     | Required parameter missing                                                   | 400              |
    | 300001     | Invalid license function                                                     | 403              |
    | 300004     | Missing authorisation                                                        | 403              |
    | 300008     | Unknown API key or Identifier                                                | 401              |
    | 300009     | Missing category(group) authorisation                                        | 403              |
    | 400001     | Person not found                                                             | 404              |
    | 400048     | Person has assigned medium                                                   | 400              |
    | 400049     | Person has assigned mechanical key                                           | 400              |
    | 400050     | Person has assigned key ring                                                 | 400              |
    | 400051     | Person has assigned key from depot                                           | 400              |
    | 400139     | Function is not allowed because tenant is not base tenant of this person     | 400              |
    | 400177     | The person of the currently logged in user can not be deleted                | 400              |
    | 400190     | Person cannot be deleted because there is one or more online locker assigned | 400              |
    | 400211     | The person is host or deputy in an upcoming or ongoing visit                 | 400              |
    | 500000     | Returned if Rabbit Mq Message could not be published                         | 400              |
    | 999999     | Unknown error                                                                | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [bool]$CheckOnly = $false,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/delete"
  $url += "?checkOnly=$CheckOnly"

  $response = Invoke-ExosApi -Method POST -Uri $url

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}