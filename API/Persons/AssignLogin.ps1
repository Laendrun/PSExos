function Exos.API.Persons.AssignLogin {
  <#
.SYNOPSIS
  Assigns a the login to the person

.DESCRIPTION
  Sends a request to assign the login to the specified person

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to assign the login to
  Default: "PersonId1"

.PARAMETER LoginId
  REQUIRED. The unique identifier of the login to assign to the person.
  Default: "LoginId1"

.PARAMETER IgnoreBlacklist
  If true, bypasses the blacklist verification during key assignment.
  Default: false

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/assignLogin/{loginId}

  Required Access Right: 	["API_SDM_EmployeeAssignLogin","API_CM_ContractorAssignLogin"]

  Possible Error Codes:
    | 100000     | Validation Error                                                            | 400              |
    | 100001     | Invalid Length                                                              | 400              |
    | 300004     | Missing authorisation                                                       | 403              |
    | 400001     | Person not found                                                            | 404              |
    | 400038     | Login not found                                                             | 404              |
    | 400039     | Login already assigned                                                      | 400              |
    | 400072     | Returned if an operation can not be executed because person is on blacklist | 400              |
    | 400146     | Person does not have the correct type                                       | 400              |
    | 500000     | Returned if Rabbit Mq Message could not be published                        | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>

  param(
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [Parameter(Mandatory = $true)]
    [string]$LoginId,
    [bool]$IgnoreBlacklist = $false,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/assignLogin/$LoginId"
  $url += "?ignoreBlacklist=$IgnoreBlacklist"

  $response = Invoke-ExosApi -Method POST -Uri $url

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  
  return $response
}