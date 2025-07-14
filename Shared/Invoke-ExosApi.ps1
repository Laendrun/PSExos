function Invoke-ExosApi {
  param(
    [string]$Method,
    [string]$Uri,
    [object]$Body = $null,
    [switch]$RawBody
  )

  $headers = @{
    Authorization  = "Bearer $($script:ExosContext.Token)"
    "Content-Type" = "application/json"
  }

  $params = @{
    Uri     = $Uri
    Method  = $Method
    Headers = $Headers
  }

  if ($Body) {
    if ($RawBody) {
      if ($Body -isnot [string]) {
        throw "When using -RawBody, the input must be a string (not a hashtable or object)."
      }
      $params.Body = $Body
    }
    else {
      $params.Body = ($Body | ConvertTo-Json -Depth 10)
    }
  }

  try {
    Invoke-RestMethod @params
  }
  catch {
    throw "API call failed: $($_.Exception.Message)"
  }
}