# win_volume_facts

Ansible module for getting volume facts.

- Works for Windows 2003 and over. Doesn't display `dedup_mode`, `health_status`, `operational_status` and `object_id`.

  This is because the module uses the `MSFT_Volume` class to get these values, and they were added with `Get-Volume` I think. These storage cmdlets only work for Windows 2012 and above, regardless of PowerShell version.
  
- `device_id`, `label`, `drive_letter` can be used further to format or remove volumes.

```json
ok: [2008r2] => {
    "ansible_facts.win_volume": [
        {
            "automount": true,
            "block_size": 4096,
            "boot_volume": true,
            "device_id": "\\\\?\\Volume{649b39c5-46cb-11e8-85a6-806e6f6e6963}\\",
            "drive_letter": "C",
            "drive_type": 3,
            "label": "C Drive Label",
            "maximum_file_name_length": 255,
            "page_file_present": true,
            "quotas_enabled": false,
            "quotas_incomplete": false,
            "quotas_rebuilding": false,
            "serial_number": 3831722921,
            "size": 53684989952,
            "size_remaining": 37904646144,
            "supports_disk_quotas": true,
            "supports_file_based_compression": true,
            "system_volume": true,
            "type": "NTFS"
        },
        {
            "automount": true,
            "block_size": 4096,
            "boot_volume": false,
            "device_id": "\\\\?\\Volume{649b39c6-46cb-11e8-85a6-806e6f6e6963}\\",
            "drive_letter": "D",
            "drive_type": 3,
            "label": "D Drive Label",
            "maximum_file_name_length": 255,
            "page_file_present": false,
            "quotas_enabled": false,
            "quotas_incomplete": false,
            "quotas_rebuilding": false,
            "serial_number": 1347868689,
            "size": 268432306176,
            "size_remaining": 268301697024,
            "supports_disk_quotas": true,
            "supports_file_based_compression": true,
            "system_volume": false,
            "type": "NTFS"
        }
    ]
}
ok: [2012r2] => {
    "ansible_facts.win_volume": [
        {
            "automount": true,
            "block_size": 4096,
            "boot_volume": true,
            "device_id": "\\\\?\\Volume{d82d9f50-46cd-11e8-80b9-806e6f6e6963}\\",
            "drive_letter": "C",
            "drive_type": 3,
            "label": "C Drive Label",
            "maximum_file_name_length": 255,
            "page_file_present": true,
            "quotas_enabled": false,
            "quotas_incomplete": false,
            "quotas_rebuilding": false,
            "serial_number": 3903679760,
            "size": 53684989952,
            "size_remaining": 36327796736,
            "supports_disk_quotas": true,
            "supports_file_based_compression": true,
            "system_volume": true,
            "type": "NTFS"
        },
        {
            "automount": true,
            "block_size": 4096,
            "boot_volume": false,
            "device_id": "\\\\?\\Volume{0b77606e-46ce-11e8-80ba-e25a0f409ce4}\\",
            "drive_letter": "D",
            "drive_type": 3,
            "label": "D Drive Label",
            "maximum_file_name_length": 255,
            "page_file_present": false,
            "quotas_enabled": false,
            "quotas_incomplete": false,
            "quotas_rebuilding": false,
            "serial_number": 2857954834,
            "size": 161058123776,
            "size_remaining": 160940253184,
            "supports_disk_quotas": true,
            "supports_file_based_compression": true,
            "system_volume": false,
            "type": "NTFS"
        }
    ]
}
```
