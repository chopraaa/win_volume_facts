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
        ansible_win_volume = @()
    }
}

try {
    $win32_volume_info = Get-CimInstance -ClassName Win32_Volume
} catch {
    Fail-Json -obj $result -message "Failed to get volumes on the target: $($_.Exception.Message)"
}

$volume_data = @()
foreach ($item in $win32_volume_info) {
    $win_volume = @{
      automount = $item.Automount
      block_size = $item.BlockSize
      boot_volume = $item.BootVolume
      device_id = $item.DeviceID
      drive_letter = $item.DriveLetter.Substring(0,1)
      drive_type = $item.DriveType
      label = $item.Label
      maximum_file_name_length = $item.MaximumFileNameLength
      page_file_present = $item.PageFilePresent
      quotas_enabled = $item.QuotasEnabled
      quotas_incomplete = $item.QuotasIncomplete
      quotas_rebuilding = $item.QuotasRebuilding
      serial_number = $item.SerialNumber
      size = $item.Capacity
      size_remaining = $item.FreeSpace
      supports_disk_quotas = $item.SupportsDiskQuotas
      supports_file_based_compression = $item.SupportsFileBasedCompression
      system_volume = $item.SystemVolume
      type = $item.FileSystem
    }
    $volume_data += $win_volume
}

$result.ansible_facts.ansible_win_volume += $volume_data

Exit-Json -obj $result
