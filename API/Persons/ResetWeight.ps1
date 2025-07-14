function Exos.API.Persons.ResetWeight {
  <#
.SYNOPSIS
  Resets the weight for a person.

.DESCRIPTION
  Resets the weight for the specified person. The weight will be set for this PersonId.

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to reset the weight for.

.PARAMETER NoMetadata
  If specified, removes OData metadata fields rom the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/resetWeight

  Required Access Right: 	["API_SDM_EmployeeResetWeight","API_VM_VisitorResetWeight","API_CM_ContractorResetWeight"]

  Possible Error Codes:
    | 100000     | Validation Error                                                            | 400              |
    | 100005     | Required parameter missing                                                  | 400              |
    | 300004     | Missing authorisation                                                       | 403              |
    | 300008     | Unknown API key or Identifier                                               | 401              |
    | 300009     | Missing category(group) authorisation                                       | 403              |
    | 400001     | Person not found                                                            | 404              |
    | 400139     | Function is not allowed because tenant is not base tenant of this person    | 400              |
    | 500000     | Returned if Rabbit Mq Message could not be published                        | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/resetWeight"

  $response = Invoke-ExosApi -Method POST -Uri $url

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}