function Exos.API.PersonsAccessRights.Get {
<#
.SYNOPSIS
  Retrieves a list of access rights for a specific person on a specific access domain
.DESCRIPTION
  Queries the EXOS API for a list of access rights for a specific person on a specific access domain filter by query parameters and OData options

.PARAMETER QueryParams
  A hashtable of query-specific filters

  Valid keys:
    - accessDomainId : (Required) The ID of the access domain from which to retrieve the access rights from
    - personType     : Available value: "All", "Employee", "Visitor", "Contractor"

.PARAMETER ODataParams
  A hashtable of OData parameters to control pagination, selection, and expansion.

  Common OData keys:
    - top                : Limits the number of records returned.
                           Default: 1000
    - skip               : Number of records to skip (for paging).
                           Default: none
    - expand             : Navigation properties to expand (e.g. "PersonBaseData($select=FirstName,LastName)")
                           Default: none
    - select             : Explicit fields to return
                           Default: none
    - filter             : OData filter expression
                           Default: none
    - orderby            : The field to order the results by
                           Default: none
    - count              : Adds total possible results to the response
                           Default: true
#>
  param (
    [hashtable]$QueryParams = @{},
    [hashtable]$ODataParams = @{},
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/personsAccessRights"
  $qs = @()

  foreach ($k in $QueryParams.Keys) {
    $qs += "$k=$($QueryParams[$k])"
  }


  foreach ($k in $ODataParams.Keys) {
    $qs += "`$$k=$($ODataParams[$k])"
  }

  if ($qs.Count -gt 0) {
    $url += "?" + ($qs -join "&")
  }

  $response = Invoke-ExosApi -Method GET -Uri $url

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}