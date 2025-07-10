function Exos.API.PersonsAccessRights.Get {
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