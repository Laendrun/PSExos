function Exos.API.Persons.DeactivateMobileAccessDevice {
<#
.SYNOPSIS
  Deactivates a Mobile Access Device.

.DESCRIPTION
  Sends a request to deactivate a mobile access device.

.PARAMETER PersonId
  The unique identifier of the person to deactivate the mobile access for.

.PARAMETER NoMetadata
  If specified, removes OData metadata fields from the returned object.

.OUTPUTS
  System.Object - API response or filtered PSCustomObject

.NOTES
  API Endpoint: POST /persons/{personId}/deactivateMobileAccessDevice

  Required Access Right: 	["API_SDM_EmployeeDeactivateMobileAccessDevice","API_VM_VisitorDeactivateMobileAccessDevice","API_CM_ContractorDeactivateMobileAccessDevice"]

  Possible Error Codes:
    | 100000     | Validation Error                                                            | 400              |
    | 100001     | Invalid Length                                                              | 400              |
    | 100002     | Input object null                                                           | 400              |
    | 100003     | String is null or empty                                                     | 400              |
    | 100004     | Invalid format                                                              | 400              |
    | 100005     | Required parameter missing                                                  | 400              |
    | 100006     | Parameter not allowed                                                       | 400              |
    | 100007     | Invalid range                                                               | 400              |
    | 100009     | Invalid value                                                               | 400              |
    | 100012     | Returned if invalid character exists                                        | 400              |
    | 300001     | Invalid license function                                                    | 403              |
    | 300004     | Missing authorisation                                                       | 403              |
    | 300008     | Unknown API key or Identifier                                               | 401              |
    | 300009     | Missing category(group) authorisation                                       | 403              |
    | 300011     | License limit reached                                                       | 403              |
    | 400014     | Category not found                                                          | 404              |
    | 400072     | Returned if an operation can not be executed because person is on blacklist | 400              |
    | 400150     | Function is not allowed because person has no mobile access device          | 400              |
    | 400152     | Mobile access service is not available                                      | 400              |
    | 500000     | Returned if Rabbit Mq Message could not be published                        | 400              |
    | 999999     | Unknown error                                                               | 500              |
#>
  param(
    [Parameter(Mandatory=$true)]
    [string]$PersonId,
    [switch]$NoMetadata
  )

  $url = "$($script:ExosContext.ApiUri)/persons/$PersonId/deactivateMobileAccessDevice"

  $response = Invoke-ExosApi -Method POST -Uri $url

  if ($NoMetadata) {
    return Remove-ODataMetadata $response
  }

  return $response
}