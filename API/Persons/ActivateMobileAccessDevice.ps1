function Exos.API.Persons.ActivateMobileAccessDevice {
<#
.SYNOPSIS
  Activates a Mobile Access Device.

.DESCRIPTION
  Sends a request to active a mobile access device.

.PARAMETER PersonId
  The unique identifier of the person to active the mobile access for.

.PARAMETER Body
  A hashtable containing the request body parameters.

  Common keys:
    - MobileNumber : (Required) The mobile phone number
    - EMail : The email adress
    - IgnoreBlacklist : If true, bypasses blacklist verification when assigning the access right.

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/activateMobileAccessDevice

  Required Access Right: ["API_SDM_EmployeeActivateMobileAccessDevice","API_VM_VisitorActivateMobileAccessDevice","API_CM_ContractorActivateMobileAccessDevice"]

  Possible Error Codes:
    | 100000     | Validation Error                                                     | 400              |
    | 100001     | Invalid Length                                                       | 400              |
    | 100002     | Input object null                                                    | 400              |
    | 100003     | String is null or empty                                              | 400              |
    | 100004     | Invalid format                                                       | 400              |
    | 100005     | Required parameter missing                                           | 400              |
    | 100006     | Parameter not allowed                                                | 400              |
#>
  param (
    [Parameter(Mandatory=$true)]
    [string]$PersonId,
    [hashtable]$Body,
    [switch]$NoMetadata
  )

  $url = ="$($script:ExosContext.ApiUri)/persons/$PersonId/activateMobileAccessDevice"

  $response = Invoke-ExosApi -Method POST -Uri $url

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }

  return $response
}