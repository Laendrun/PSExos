function Exos.Auth.Revoke {
  if (-not $script:ExosContext.Token) {
    return
  }

  $url = "$($script:ExosContext.AuthUri)/token/revoke"
  $body = @{ token = $script:ExosContext.Token}

  try {
    Invoke-RestMethod -Uri $url -Method Post -Body ($body | ConvertTo-Json) -ContentType "application/json"
    Write-Verbose "EXOS token revoked"
  } catch {
    Write-Warning "Failed to revoke EXOS token: $($_.Exception.Message)"
  } finally {
    # Reset context
    $script:ExosContext.Token = $null
  }
}