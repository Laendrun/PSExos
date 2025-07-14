function Exos.API.Persons.AssignTransitionalBadge {
  <#
.SYNOPSIS
  Assigns the transitional badge to the person

.DESCRIPTION
  Sends a request to assign the transitional badge to the specified person

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to assign the transitional badge to

.PARAMETER Body
  REQUIRED. A hashtable containing the parameters

  Common keys:
    - TransitionalBadgeName : (Required) The name of the transitional badge
                              Default: ApiTransitionalCard1
    - CurrentBadgeName      : (Required) The currently assigned badge of the person
                              Default: ApiCard1
    - ValidTo               : (Required) The date until when the transitional badge is valid
                              Example: "2001-01-31T11:55:00.000"
    - PledgeText            : A text label for transitional badge pledge
                              Default: ""
                              Nullable: true
    - PledgeAmount          : Numeric amount associated with the pledge
                              Default: 1
                              Nullable: true
    - Comment               : Optional comment about the assignment
                              Default: ""
                              Nullable: true

.PARAMETER IgnoreBlacklist
  If true, bypasses the blacklist verification during key assignment
  Default: false

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/assignTransitionalBadge

  Required Access Right: ["API_SDM_EmployeeAssignTransitionalBadge","API_CM_ContractorAssignTransitionalBadge"]

  Possible Error Codes:
    | 100000     | Validation Error                                                            | 400              |
    | 100001     | Invalid Length                                                              | 400              |
    | 100002     | Input object null                                                           | 400              |
    | 100004     | Invalid format                                                              | 400              |
    | 100005     | Required parameter missing                                                  | 400              |
    | 100006     | Parameter not allowed                                                       | 400              |
    | 100007     | Invalid range                                                               | 400              |
    | 100008     | Allowed media count exceeded                                                | 400              |
    | 300002     | Media roleauth is incompatible to person type                               | 400              |
    | 300004     | Missing authorisation                                                       | 403              |
    | 300008     | Unknown API key or Identifier                                               | 401              |
    | 400001     | Person not found                                                            | 404              |
    | 400004     | Media already assigned                                                      | 400              |
    | 400005     | Media is not assigned to this person                                        | 400              |
    | 400007     | Media not found                                                             | 404              |
    | 400025     | Media role does not match person type                                       | 400              |
    | 400069     | Returned if a transitional media will replace a smartkey                    | 400              |
    | 400070     | Returned if a smartkey is used as transitional media                        | 400              |
    | 400072     | Returned if an operation can not be executed because person is on blacklist | 400              |
    | 400087     | A transitional media already exists for current media                       | 400              |
    | 400094     | If the system is not configured for transitional cards                      | 400              |
    | 400095     | If the current role of the parent media is not the standard role            | 404              |
    | 400146     | Person does not have the correct type                                       | 400              |
    | 400165     | The person has no authorisation for intervention media                      | 400              |
    | 500000     | Returned if Rabbit Mq Message could not be published                        | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param(
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [Parameter(Mandatory = $true)]
    [hashtable]$Body,
    [bool]$IgnoreBlacklist = $false,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/assignTransitionalBadge"
  $url += "?ignoreBlacklist=$IgnoreBlacklist"

  $response = Invoke-ExosApi -Method POST -Uri $url -Body $Body

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}