# PSExos PowerShell Module

## What's this ?

This module provides a PowerShell interface to interact with the **Dormakaba EXOS9300 system** via its REST API.

---

## Usage Overview

```powershell
# Import the module
Import-Module PSExos

# Login to EXOS API
Exos.Auth.Login -Server 'servername' -Username 'apiuser' -Password 'password'

# Retrieve a list of employees
$users = Exos.API.Persons.Get -QueryParams @{ personType = 'Employee' } -ODataParams @{ top = 5 } -NoMetadata
$users.value | Format-Table

# Get access domains
$domains = Exos.API.AccessDomains.Get -ODataParams @{ select = 'AccessDomainId,DisplayName,Description', filter = "endswith(DisplayName, '21')"}

$domainId = $domains.value.AccessDomainId
$userId = '123'

$access = Exos.API.PersonsAccessRights.Get -QueryParams @{ accessDomainId = $domainId } -ODataParams @{ filter = "PersonId eq '$userId'" }

$access.value | Format-Table

# You can manually log-out at the end of script execution
Exos.Auth.Revoke

# Or, when you login, the script registers an action on the PowerShell.Exiting event to automatically revoke the token when the PowerShell session is closed
```

---

This module is under development and more endpoints are, for now, added as needed.
