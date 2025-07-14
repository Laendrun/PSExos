function Exos.API.Persons.UnassignAccessRight {
  <#
.SYNOPSIS
  Un-assigns an access right to a person in the EXOS system.

.DESCRIPTION
  Sends a request to un-assign an access right to the specified person.

.PARAMETER PersonId
  The unique identifier of the person to un-assign the access right from.

.PARAMETER Body
  A hashtable containing the access right un-assignment parameters.

  Common keys:
    - AccessRightId : (Required) The unique identifier of the access right to un-assign.
                      Default: AccessRightId1
    - ValidFrom     : Optional validity start
                      Nullable: true
                      Example: 2001-01-31T11:55:00.000
    - ValidTo       : Optional validity end
                      Nullable: true
                      Example: 2001-01-31T11:55:00.000

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/unassignAccessRight

  Required Access Right: ["API_SDM_EmployeeUnassignAccessRight","API_VM_VisitorUnassignAccessRight","API_CM_ContractorUnassignAccessRight"]

  Possible Error Codes:
    | 100000     | Validation Error                                                            | 400              |
    | 100001     | Invalid Length                                                              | 400              |
    | 100002     | Input object null                                                           | 400              |
    | 100004     | Invalid format                                                              | 400              |
    | 100005     | Required parameter missing                                                  | 400              |
    | 100006     | Parameter not allowed                                                       | 400              |
    | 100007     | Invalid range                                                               | 400              |
    | 300004     | Missing authorisation                                                       | 403              |
    | 300008     | Unknown API key or Identifier                                               | 401              |
    | 400001     | Person not found                                                            | 404              |
    | 400010     | Access right not found                                                      | 404              |
    | 400013     | Access right not assigned                                                   | 400              |
    | 400143     | Access rights do not belong to current tenant                               | 400              |
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

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/unassignAccessRight"
  
  $response = Invoke-ExosApi -Method POST -Uri $url -Body $Body

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}