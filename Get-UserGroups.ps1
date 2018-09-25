#Get-UserGroups v0.1 9-21-2018 jpm

#Test Names
$userNames = @("")
$userGroups = @()
$groupInfo = @()
$groupInfo = [PSCustomObject] @{}

ForEach ($name in $userNames) {
    $strGroups = $null
    $userGroups = Get-ADPrincipalGroupMembership $name | Select-Object Name
    $strGroups = ($userGroups.Name | Out-String).Trim()
    $groupInfo | Add-Member -MemberType NoteProperty -Name $name.ToString() -Value $strGroups
}

$groupInfo | Format-Table -wrap
