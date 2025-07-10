function Exos.API.AccessDomains.Get {
<#
.SYNOPSIS
  Retrieves a list of AccessDomains from the EXOS system.

.DESCRIPTION
  Queries the EXOS API for a list of access domains, filtered by optional query parameters and OData options

.PARAMETER QueryParams
  A hashtable of query-specific filters.

  Valid keys:
    - searchString : A search term to apply to the access domains data.

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

.PARAMETER NoMetadata
  If specified, removes OData metadata fields (e.g., "@odata.context") from the returned object.

.EXAMPLE
  Exos.API.AccessDomains.Get -ODataParams @{ "select" = 'AccessDomainId,DisplayName,Description' }

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: GET /accessDomains

  Required Access Right: 	"API_AC_AccessDomainsRead"

  Possible Error Codes:
    | 300004     | Missing authorisation                                                | 403              |
    | 300008     | Unknown API key or Identifier                                        | 401              |
    | 400088     | The read permission for the field is missing                         | 403              |
    | 999999     | Unknown error                                                        | 500              |
  
  Other notes:
    Be aware that a query made here can return up to 10000 records.
    If you need more, please use the built in paging funcitonality with $top and $skip.
#>
  param (
    [hashtable]$QueryParams = @{},
    [hashtable]$ODataParams = @{},
    [switch]$NoMetadata
  )
  
  $url = "$($script:ExosContext.ApiUri)/accessDomains"
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