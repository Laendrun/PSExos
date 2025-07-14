function Exos.API.Persons.SetPin {
  <#
.SYNOPSIS
  Sets a PIN for a person.

.DESCRIPTION
  Sets a PIN for the specified person.

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to set the pin for.

.PARAMETER Pin
  REQUIRED. The Pin to set to the user.

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/setPin

  Required Acces Right: ["API_SDM_EmployeeSetPinCode","API_CM_ContractorSetPinCode","API_VM_VisitorSetPinCode"]

  Possible Error Codes:
    | 100000     | Validation Error                                                            | 400              |
    | 100001     | Invalid Length                                                              | 400              |
    | 100002     | Input object null                                                           | 400              |
    | 100003     | String is null or empty                                                     | 400              |
    | 100004     | Invalid format                                                              | 400              |
    | 100005     | Required parameter missing                                                  | 400              |
    | 100006     | Parameter not allowed                                                       | 400              |
    | 300004     | Missing authorisation                                                       | 403              |
    | 300008     | Unknown API key or Identifier                                               | 401              |
    | 300009     | Missing category(group) authorisation                                       | 403              |
    | 400001     | Person not found                                                            | 404              |
    | 400139     | Function is not allowed because tenant is not base tenant of this person    | 400              |
    | 400146     | Person does not have the correct type                                       | 400              |
    | 500000     | Returned if Rabbit Mq Message could not be published                        | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [Parameter(Mandatory = $true)]
    [string]$Pin,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/setPin"
  $body = '"{0}"' -f $Pin

  $response = Invoke-ExosApi -Method POST -Uri $url -Body $body -RawBody

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}