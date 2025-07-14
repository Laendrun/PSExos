function Exos.API.Persons.Block {
  <#
.SYNOPSIS
  Blocks a person.

.DESCRIPTION
  Sends a request to block the specified person.

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person block.

.PARAMETER Body
  REQUIRED. A hashtable containing the parameters.

  Common keys:
    - Reason  : (Required) The reason for blocking the user
                Default: ""
    - Comment : A comment related to blocking the user
                Default: ""
                Nullable: true

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/block

  Required Access Right: 	["API_SDM_EmployeeBlock","API_VM_VisitorBlock","API_CM_ContractorBlock"]

  Possible Error Codes:
    | 100000     | Validation Error                                                            | 400              |
    | 100001     | Invalid Length                                                              | 400              |
    | 100002     | Input object null                                                           | 400              |
    | 100005     | Required parameter missing                                                  | 400              |
    | 100006     | Parameter not allowed                                                       | 400              |
    | 300004     | Missing authorisation                                                       | 403              |
    | 300008     | Unknown API key or Identifier                                               | 401              |
    | 300009     | Missing category(group) authorisation                                       | 403              |
    | 400001     | Person not found                                                            | 404              |
    | 400026     | Person already blocked                                                      | 400              |
    | 400072     | Returned if an operation can not be executed because person is on blacklist | 400              |
    | 400139     | Function is not allowed because tenant is not base tenant of this person    | 400              |
    | 500000     | Returned if Rabbit Mq Message could not be published                        | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [Parameter(Mandatory = $true)]
    [hashtable]$Body,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/block"

  $response = Invoke-ExosApi -Method POST -Uri $url -Body

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}