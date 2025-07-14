function Exos.API.Persons.Image {
  <#
.SYNOPSIS
  Gets the image of the person.

.DESCRIPTION
  Gets the image of the person as a base64 encoded string without additional information.

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to get the image from.

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: GET /persons/{personId}/image

  Required Access Right: 	["API_SDM_EmployeeImageRead","API_VM_VisitorImageRead","API_CM_ContractorImageRead"]

  Possible Error Codes:
    | 100000     | Validation Error                                                            | 400              |
    | 100002     | Input object null                                                           | 400              |
    | 300008     | Unknown API key or Identifier                                               | 401              |
    | 400001     | Person not found                                                            | 404              |
    | 400139     | Function is not allowed because tenant is not base tenant of this person    | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonsId/image"

  $response = Invoke-ExosApi -Method GET -Uri $url

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}