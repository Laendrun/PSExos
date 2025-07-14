function Exos.API.Persons.SetRoom {
  <#
.SYNOPSIS
  Sets a room for a person.

.DESCRIPTION
  Sets a room for the specified person.

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to set the room for.

.PARAMETER Room
  REQUIRED. The Room to set to the user.

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/setRoom

  Required Access Right: 	["API_SDM_EmployeeSetRoom","API_VM_VisitorSetRoom","API_CM_ContractorSetRoom"]

  Possible Error Codes:
    | 100000     | Validation Error                                                            | 400              |
    | 300004     | Missing authorisation                                                       | 403              |
    | 300008     | Unknown API key or Identifier                                               | 401              |
    | 300009     | Missing category(group) authorisation                                       | 403              |
    | 400001     | Person not found                                                            | 404              |
    | 400035     | Room not found                                                              | 404              |
    | 400144     | Room does not belong to current tenant                                      | 400              |
    | 500000     | Returned if Rabbit Mq Message could not be published                        | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [Parameter(Mandatory = $true)]
    [string]$Room,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/setRoom"
  $body = '"{0}"' -f $Room

  $response = Invoke-ExosApi -Method POST -Uri $url -Body $Body -RawBody

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}