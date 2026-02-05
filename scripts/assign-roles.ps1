# Example: Assign Helpdesk Admin
$UserId = (Get-MgUser -UserId "helpdesk1@contoso.com").Id
$RoleId = (Get-MgRoleDefinition -Filter "displayName eq 'Helpdesk Administrator'").Id
New-MgDirectoryRoleMember -DirectoryRoleId $RoleId -Members $UserId


<# 
.SYNOPSIS
    Lists all Microsoft Entra directory roles and their assigned users.

.DESCRIPTION
    - Connects to Microsoft Graph
    - Enumerates all active directory roles
    - Resolves member object IDs to user display names
    - Outputs table to console
    - Exports CSV for documentation/audit

.OUTPUT
    role-members-report.csv
#>

Write-Host "Connecting to Microsoft Graph..." -ForegroundColor Cyan

Connect-MgGraph -Scopes "RoleManagement.Read.All","User.Read.All"

Write-Host "Collecting role assignments..." -ForegroundColor Cyan

$results = @()

$roles = Get-MgDirectoryRole

foreach ($role in $roles) {

    $members = Get-MgDirectoryRoleMember -DirectoryRoleId $role.Id

    foreach ($member in $members) {

        try {
            $user = Get-MgUser -UserId $member.Id -ErrorAction Stop

            $results += [PSCustomObject]@{
                RoleName          = $role.DisplayName
                DisplayName       = $user.DisplayName
                UserPrincipalName = $user.UserPrincipalName
            }
        }
        catch {
            # Skip non-user objects (groups/service principals)
        }
    }
}

# Display nice table
$results | Sort RoleName | Format-Table -AutoSize

# Export for documentation
$csvPath = ".\role-members-report.csv"
$results | Export-Csv $csvPath -NoTypeInformation

Write-Host "`nReport exported to $csvPath" -ForegroundColor Green
