function Exos.API.Persons.AssignBadge {
  <#
.SYNOPSIS
  Assigns the badge to the person

.DESCRIPTION
  Sends a request to assign the badge to the specified person.

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to assign the badge to.

.PARAMETER Body
  A hashtable containing the badge assignement parameters.

  Common keys:
    - BadgeName    : (Required) Name of the badge to assign
                     Default: ApiCard1
                     Nullable: true
    - PledgeText   : A text label for badge pledge
                     Default: ""
                     Nullable: true
    - PledgeAmount : Numeric amount associated with the pledge
                     Default: 1
                     Nullable: true
    - Comment      : Optional comment about the assignement
                     Default: ""
                     Nullable: true
    - VisitId      : Required if the person is a visitor
                     Default: ""
                     Nullable: true

.PARAMETER IgnoreBlacklist
  If true, bypasses blacklist verification during badge assignement.
  Default: false

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/assignBadge

  Required Access Right: ["API_SDM_EmployeeAssignBadge","API_VM_VisitorAssignBadge","API_CM_ContractorAssignBadge"]

  Possible Error Codes:
    | 100000     | Validation Error                                                            | 400              |
    | 100001     | Invalid Length                                                              | 400              |
    | 100002     | Input object null                                                           | 400              |
    | 100005     | Required parameter missing                                                  | 400              |
    | 100006     | Parameter not allowed                                                       | 400              |
    | 100007     | Invalid range                                                               | 400              |
    | 100008     | Allowed media count exceeded                                                | 400              |
    | 300002     | Media roleauth is incompatible to person type                               | 400              |
    | 300004     | Missing authorisation                                                       | 403              |
    | 300008     | Unknown API key or Identifier                                               | 401              |
    | 400001     | Person not found                                                            | 404              |
    | 400004     | Media already assigned                                                      | 400              |
    | 400007     | Media not found                                                             | 404              |
    | 400065     | Key assignement could not be made, because the key is already assinged      | 400              |
    | 400066     | Key assignement could not be made, key is part of a keyring                 | 400              |
    | 400067     | Key assignement could not be made, key state is not assignable              | 400              |
    | 400072     | Returned if an operation can not be executed because person is on blacklist | 400              |
    | 400104     | The visit cannot be found                                                   | 404              |
    | 400128     | Visit information (VisitId) needed when assigning a badge to a visitor      | 400              |
    | 400139     | Function is not allowed because tenant is not base tenant of this person    | 400              |
    | 400147     | The operation is not supported for mobile access media                      | 400              |
    | 400165     | The person has no authorisation for intervention media                      | 400              |
    | 500000     | Returned if Rabbit Mq Message could not be published                        | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [hashtable]$Body,
    [bool]$IgnoreBlacklist = $false,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/assignBadge"
  $url += "?ignoreBlacklist=$IgnoreBlacklist"

  $response = Invoke-ExosApi -Method POST -Uri $url -Body $Body

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }

  return $response
}