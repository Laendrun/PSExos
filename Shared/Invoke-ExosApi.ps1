function Invoke-ExosApi {
  param(
    [string]$Method,
    [string]$Uri,
    [object]$Body = $null
  )

  $headers = @{
    Authorization = "Bearer $($script:ExosContext.Token)"
    "Content-Type" = "application/json"
  }

  $params = @{
    Uri = $Uri
    Method = $Method
    Headers = $Headers
  }

  if ($Body) {
    $params.Body = ($Body | ConvertTo-Json -Depth 10)
  }

  try {
    Invoke-RestMethod @params
  } catch {
    throw "API call failed: $($_.Exception.Message)"
  }
}