function Remove-ODataMetadata {
  param (
    [object]$InputObject
  )

  if ($InputObject -is [System.Collections.IEnumerable] -and -not ($InputObject -is [string])) {
    return $InputObject | ForEach-Object { Remove-ODataMetadata $_ }
  }

  if ($InputObject -is [PSCustomObject]) {
    $filtered = @{}

    foreach ($property in $InputObject.PSObject.Properties) {
      if ($property.Name -notlike '*@odata.*') {
        $filtered[$property.Name] = Remove-ODataMetadata $property.Value
      }
    }
    return [PSCustomObject]$filtered
  }

  return $InputObject
}