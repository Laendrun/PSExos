function Exos.API.Persons.ActivateMobileAccessDevice {
  param (
    [Parameter(Mandatory=$true)]
    [string]$PersonId,
    [switch]$NoMetadata
  )

  $url = ="$($script:ExosContext.ApiUri)/persons/$PersonId/activateMobileAccessDevice"

  $response = Invoke-ExosApi -Method POST -Uri $url

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }

  return $response
}