function Exos.API.Persons.AssignKeyRing {
  <#
.SYNOPSIS
  Assigns the KeyRing to the person

.DESCRIPTION
  Sends a request to assign the keyring to the specified person

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to assign the keyring to.

.PARAMETER Body
  REQUIRED. A hashtable containing the key assignment parameters.

  Common keys:
    - KeyRingId     : (Required) The unique identifier of the keyring to assign
                      Default: KeyRingId01
    - PledgeText    : A text label for keyring pledge
                      Default: ""
                      Nullable: true
    - PledgeAmount  : Numeric amount associated with the pledge
                      Default: 1
                      Nullable: true
    - Comment       : Optional comment about the assignment
                      Default: ""
                      Nullable: true

.PARAMETER IgnoreBlacklist
  If true, bypasses the blacklist verification during key assignment.
  Default: false

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/assignKeyRing

  Required Access Right: 	["API_SDM_EmployeeAssignKeyRing","API_CM_ContractorAssignKeyRing"]

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
    | 400067     | Key assignement could not be made, key state is not assignable              | 400              |
    | 400072     | Returned if an operation can not be executed because person is on blacklist | 400              |
    | 400074     | Keyring assignement could not be made, keyring is already assigned          | 400              |
    | 400139     | Function is not allowed because tenant is not base tenant of this person    | 400              |
    | 400146     | Person does not have the correct type                                       | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [hashtable]$Body,
    [bool]$IgnoreBlacklist = $false,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/assignKeyRing"
  $url += "?ignoreBlacklist=$IgnoreBlacklist"

  $response = Invoke-ExosApi -Method POST -Uri $url -Body $Body

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }

  return $response
}