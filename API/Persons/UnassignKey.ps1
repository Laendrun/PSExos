function Exos.API.Persons.UnassignKey {
  param (
    [Parameter(Mandatory = $true)]
    [string]$PersonId,
    [Parameter(Mandatory = $true)]
    [string]$KeyId,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/unassignKey"

  $Body = @{
    "KeyId" = $KeyId
  }

  $response = Invoke-ExosApi -Method POST -Uri $url $Body

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }
  return $response
}