# Shared Utils
. $PSScriptRoot\Shared\Context.ps1
. $PSScriptRoot\Shared\Invoke-ExosApi.ps1
. $PSScriptRoot\Shared\Remove-Metadata.ps1

# Auth commands
. $PSScriptRoot\Auth\Login.ps1
. $PSScriptRoot\Auth\Revoke.ps1

# API Commands
# Persons
. $PSScriptRoot\API\Persons\Get.ps1
. $PSScriptRoot\API\Persons\ActivateMobileAccessDevice.ps1
. $PSScriptRoot\API\Persons\DeactivateMobileAccessDevice.ps1
. $PSScriptRoot\API\Persons\AssignAccessRights.ps1
. $PSScriptRoot\API\Persons\AssignBadge.ps1
. $PSScriptRoot\API\Persons\AssignInitializedBadge.ps1
. $PSScriptRoot\API\Persons\AssignKey.ps1
. $PSScriptRoot\API\Persons\AssignKeyRing.ps1
. $PSScriptRoot\API\Persons\AssignLogin.ps1
. $PSScriptRoot\API\Persons\AssignTransitionalBadge.ps1
. $PSScriptRoot\API\Persons\Block.ps1
. $PSScriptRoot\API\Persons\Delete.ps1
. $PSScriptRoot\API\Persons\Image.ps1
. $PSScriptRoot\API\Persons\ReleaseToTenant.ps1
. $PSScriptRoot\API\Persons\ResetWeight.ps1
. $PSScriptRoot\API\Persons\SetPin.ps1
. $PSScriptRoot\API\Persons\SetRoom.ps1
. $PSScriptRoot\API\Persons\Tenants.ps1
. $PSScriptRoot\API\Persons\UnassignAccessRight.ps1

# PersonsAccessRights
. $PSScriptRoot\API\PersonsAccessRights\Get.ps1

# AccessDomains
. $PSScriptRoot\API\AccessDomains\Get.ps1
