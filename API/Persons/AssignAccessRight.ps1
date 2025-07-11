function Exos.API.Persons.AssignAccessRight {
  <#
.SYNOPSIS
  Assigns an access right to a person in the EXOS system.

.DESCRIPTION
  Sends a request to assign an access right to the specified person.
  The required and optional parameters vary depending on the type of access being assigned.
  If assigning an access right to a visitor, the `VisitId` parameter is mandatory.

.PARAMETER PersonId
  The unique identifier of the person to assign the access right to.

.PARAMETER Body
  A hashtable containing the access right assignment paramters.

  Common keys:
    - AccessRightId       : (Required) ID of the access right to assign
    - AccessRightType     : (Required) Type of the access right
    - TimeZoneId          : Required for certain types (see matrix)
    - VisitId             : Required for visitor assignments
    - ValidFrom           : Optional validity start
    - ValidTo             : Option validity end
    - Comment             : Optional comment
    - SecurityLevel       : Required for some types if enforced by system
    - IsOfficeModeEnabled : Optional toggle

.PARAMETER IgnoreBlacklist
  If true, bypasses blacklist verification when assigning the access right.
  Default: false

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/assignAccessRight

  Required Access Right: 	["API_SDM_EmployeeAssignAccessRight","API_VM_VisitorAssignAccessRight","API_CM_ContractorAssignAccessRight"]

  Parameter Requirements by AccessRightType:

  AccessRightType        | Required Parameters       | Optional Parameters                                              | Not Allowed Parameters
  -----------------------|---------------------------|------------------------------------------------------------------|-----------------------------------------------
  ProfileSuperCollection | AccessRightId             | ValidFrom, ValidTo, Comment                                      | SecurityLevel, TimeZoneId, IsOfficeModeEnabled
  ProfileCollection      | AccessRightId             | ValidFrom, ValidTo, Comment                                      | SecurityLevel, TimeZoneId, IsOfficeModeEnabled
  Profile                | AccessRightId             | ValidFrom, ValidTo, Comment                                      | SecurityLevel, TimeZoneId, IsOfficeModeEnabled
  DoorGroup              | AccessRightId, TimeZoneId | ValidFrom, ValidTo, Comment, IsOfficeModeEnabled                 | SecurityLevel
  AccessGrid             | AccessRightId, TimeZoneId | ValidFrom, ValidTo, Comment, IsOfficeModeEnabled, SecurityLevel* | -
  AccessGridDepot        | AccessRightId, TimeZoneId | ValidFrom, ValidTo, Comment, IsOfficeModeEnabled, SecurityLevel* | -
  AccessGridParking      | AccessRightId, TimeZoneId | ValidFrom, ValidTo, Comment, IsOfficeModeEnabled, SecurityLevel* | -
  ComponentStandalone    | AccessRightId, TimeZoneId | ValidFrom, ValidTo, Comment, IsOfficeModeEnabled                 | SecurityLevel

  *SecurityLevel is required only if configured in the system.

  Possible Error Codes:
    | 300004     | Missing authorisation                                                | 403              |
    | 300008     | Unknown API key or Identifier                                        | 401              |
    | 400090     | Access domain not found                                              | 404              |
    | 999999     | Unknown error                                                        | 500              |

  Other notes:
    - If the person is a visitor, you must provide a `VisitId` in the body.
    - The EXOS system may reject overlapping or conflicting access rights unles explicitly allowed.
    - The access right type determines validation logic and allowed combination
#>
  param (
    [Parameter(Mandatory)]
    [string]$PersonId,
    [hashtable]$Body,
    [bool]$IgnoreBlacklist = $false,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/assignAccessRight"
  $url += "?ignoreBlacklist=$IgnoreBlacklist"

  $response = Invoke-ExosApi -Method POST -Uri $url -Body $Body

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }

  return $response
}