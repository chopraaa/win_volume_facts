#!powershell

# Copyright: (c) 2018, Varun Chopra
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

#Requires -Module Ansible.ModuleUtils.Legacy
$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

function Test-Admin {
    $CurrentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $IsAdmin = $CurrentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    return $IsAdmin
}

if (-not (Test-Admin)) {
    Fail-Json -obj @{} -message "Module was not started with elevated rights"
}

$result = @{
    changed = $false
    ansible_facts = @{
        ansible_os_volumes = @()
    }
}

try {
    $msft_volume_info = Get-CimInstance -Namespace ROOT/Microsoft/Windows/Storage -ClassName MSFT_Volume
} catch {
    Fail-Json -obj $result -message "Failed to get volumes on the target: $($_.Exception.Message)"
}

try {
    $win32_volume_info = Get-CimInstance -ClassName Win32_Volume
} catch {
    Fail-Json -obj $result -message "Failed to get volumes on the target: $($_.Exception.Message)"
}

$volume_data = @()
foreach ($item in $win32_volume_info) {
    $win_volume = @{
        health_status = ($msft_volume_info | Where-Object { $_.UniqueId -eq $item.DeviceId } | Select HealthStatus).HealthStatus
        operational_status = ($msft_volume_info | Where-Object { $_.UniqueId -eq $item.DeviceId } | Select OperationalStatus).OperationalStatus
        drive_letter = ($msft_volume_info | Where-Object { $_.UniqueId -eq $item.DeviceId } | Select DriveLetter).DriveLetter
        dedup_mode = ($msft_volume_info | Where-Object { $_.UniqueId -eq $item.DeviceId } | Select DedupMode).DedupMode
        object_id = ($msft_volume_info | Where-Object { $_.UniqueId -eq $item.DeviceId } | Select ObjectId).ObjectId
        size = $item.Capacity
        size_remaining = $item.FreeSpace
        device_id = $item.DeviceID
        block_size = $item.BlockSize
        automount = $item.Automount
        boot_volume = $item.BootVolume
        drive_type = $item.DriveType
        file_system_type = $item.FileSystem
        friendly_name = $item.Label
        maximum_file_name_length = $item.MaximumFileNameLength
        page_file_present = $item.PageFilePresent
        quotas_enabled = $item.QuotasEnabled
        quotas_incomplete = $item.QuotasIncomplete
        quotas_rebuilding = $item.QuotasRebuilding
        serial_number = $item.SerialNumber
        supports_disk_quotas = $item.SupportsDiskQuotas
        supports_file_based_compression = $item.SupportsFileBasedCompression
        system_volume = $item.SystemVolume
    }
    $volume_data += $win_volume
}

$result.ansible_facts.ansible_os_volumes += $volume_data

Exit-Json -obj $result
