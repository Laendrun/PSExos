function Exos.API.Persons.AssignInitializedBadge {
  <#
.SYNOPSIS
  Assigns the initialized badge to the person

.DESCRIPTION
  Sends a request to assign the initialized badge to the specified person.

.PARAMETER PersonId
  REQUIRED. The unique identifier of the person to assign the badge to.

.PARAMETER Body
  A hashtable containing the badge assignment parameters.

  Common keys:
    - InitializedBadgeName  : (Required) Name of the initialized badge to assign
                              Default: ApiInitializedCard1
    - CurrentBadgeName      : (Required) Name of the current badge of the person
                              Default: ApiCard1
    - ValidFrom             : Date from when the badge is valid
                              Nullable: true
                              Example: 2001-01-31T11:55:00.000
    - PledgeText            : A text label for badge pledge
                              Default: ""
                              Nullable: true
    - PledgeAmount          : Numeric amount associated with the pledge
                              Default: 1
                              Nullable: true
    - Comment               : Optional comment about the assignement
                              Default: ""
                              Nullable: true
#>
  param(
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [hashtable]$Body,
    [bool]$IgnoreBlacklist,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/assignInitializedBadge"
  $url += "?ignoreBlacklist=$IgnoreBlacklist"

  $response = Invoke-ExosApi -Method POST -Uri $url -Body $Body

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }

  return $response
}