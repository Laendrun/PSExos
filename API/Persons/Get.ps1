function Exos.API.Persons.Get {
<#
.SYNOPSIS
  Retrieves a list of persons from the EXOS system.

.DESCRIPTION
  Queries the EXOS API for a list of persons, filtered by optional query paramaters and OData options.

.PARAMETER QueryParams
  A hashtable of query-specific filters.

  Valid keys:
    - personType         : Filters person type. Accepts: "All", "Employee", "Visitor", "Contractor"
                           Default: "All"
    - searchString       : A search term to apply to the person data.
    - searchStringLogic  : Determines the matching strategy. Accepts:
                           "SelectedFields", "BasicFields", "PersonalNumberOnly"
                           Default: "SelectedFields"

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
  Exos.API.Persons.Get -QueryParams @{ personType = 'Employee' } -ODataParams @{ top = 10 }

.EXAMPLE
  Exos.API.Persons.Get -QueryParams @{ searchString = 'Doe' } -NoMetadata

.OUTPUTS
    System.Object – API response or filtered PSCustomObject

.NOTES
  API Endpoint: GET /persons

  Required Access Right: ["API_SDM_EmployeeRead","API_VM_VisitorRead","API_CM_ContractorRead"]

  Possible Error Codes:
    | 300004     | Missing authorisation                                                | 403              |
    | 300008     | Unknown API key or Identifier                                        | 401              |
    | 400088     | The read permission for the field is missing                         | 403              |
    | 999999     | Unknown error                                                        | 500              |

  Other notes:
    Be aware that a query made here can return up to 10000 records.
    If you need more, please use the built in paging functionality with $top and $skip.
    The provided searchString will result in a fulltext search on all selected fields.
    If the passed value is encapsulated with quotes, it will be treated as an exact match search,
    otherwise the passed value will be an OR search over all keywords (splitted by space character).
#>

  param (
    [hashtable]$QueryParams = @{},
    [hashtable]$ODataParams = @{},
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons"
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