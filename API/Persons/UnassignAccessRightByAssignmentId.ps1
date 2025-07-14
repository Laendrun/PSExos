function Exos.API.Persons.UnassignAccessRightByAssignmentId {
  <#
.SYNOPSIS
  Un-assigns an access right from a person in the EXOS system based on assignment ID.
.DESCRIPTION
  Un-assigns the access rights specified by AssignementId from the person specified by PersonId

.PARAMETER PersonId
  The unique identifier of the person to un-assign the access right from.

.PARAMETER AssignmentId
  The unique identifier of the assignment to base the un-assignment on.

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personid}/unassignAccessRight/{assignmentId}

  Required Access Right: 	["API_SDM_EmployeeUnassignAccessRight","API_VM_VisitorUnassignAccessRight","API_CM_ContractorUnassignAccessRight"]

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
    | 500000     | Returned if Rabbit Mq Message could not be published                        | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [Parameter(Mandatory = $true)]
    [string]$AssignmentId,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/unassignAccessRight/$AssignmentId"

  $response = Invoke-ExosApi -Method POST -Uri $url

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}