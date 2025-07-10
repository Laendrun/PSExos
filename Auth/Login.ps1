function Exos.Auth.Login {
  param (
    [string]$Server,
    [string]$Username,
    [string]$Password
  )

  $authUrl = "https://$Server/ExosAuth/api/v1/login"

  $body = @{
    tenantId = 1
    requestChannel = 0
    username = $Username
    password = $Password
  }

  $token = Invoke-RestMethod -Uri $authUrl -Method Post -Body ($body | ConvertTo-Json) -ContentType "application/json"
  Set-ExosContext -Server $Server -Token $token

  Register-EngineEvent PowerShell.Exiting -Action { Exos.Auth.Revoke }

  return $token
}