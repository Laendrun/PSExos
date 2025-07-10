$script:ExosContext = @{
  Token = $null
  Server = $null
  AuthUri = $null
  ApiUri = $null
}

function Set-ExosContext {
  param (
    [string]$Server,
    [string]$Token
  )

  $script:ExosContext.Token = $Token
  $script:ExosContext.Server = $Server
  $script:ExosContext.AuthUri = "https://$Server/ExosAuth/api/v1"
  $script:ExosContext.ApiUri = "https://$Server/ExosAPI/api/v1.0"
}