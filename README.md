# win_volume_facts

Ansible module for getting volume facts.

```json
[
    {
        "object_id":  "{1}\\\\LP\\root/Microsoft/Windows/Storage/Providers_v2\\WSP_Volume.ObjectId=\"{d2f53c32-f656-11e7-82d4-806e6f6e6963}:VO:\\\\?\\Volume{6732978e-0000-
0000-0000-100000000000}\\\"",
        "friendly_name":  "System Reserved",
        "serial_number":  3001733236,
        "drive_letter":  null,
        "system_volume":  true,
        "drive_type":  3,
        "device_id":  "\\\\?\\Volume{6732978e-0000-0000-0000-100000000000}\\",
        "operational_status":  "OK",
        "file_system_type":  "NTFS",
        "quotas_rebuilding":  false,
        "block_size":  4096,
        "boot_volume":  false,
        "health_status":  "Healthy",
        "size":  524283904,
        "maximum_file_name_length":  255,
        "automount":  true,
        "page_file_present":  false,
        "supports_disk_quotas":  true,
        "supports_file_based_compression":  true,
        "quotas_enabled":  false,
        "size_remaining":  138530816,
        "quotas_incomplete":  false,
        "dedup_mode":  "NotAvailable"
    },
    {
        "object_id":  "{1}\\\\LP\\root/Microsoft/Windows/Storage/Providers_v2\\WSP_Volume.ObjectId=\"{d2f53c32-f656-11e7-82d4-806e6f6e6963}:VO:\\\\?\\Volume{6732978e-0000-
0000-0000-501f00000000}\\\"",
        "friendly_name":  "Windows",
        "serial_number":  1861003929,
        "drive_letter":  "C",
        "system_volume":  false,
        "drive_type":  3,
        "device_id":  "\\\\?\\Volume{6732978e-0000-0000-0000-501f00000000}\\",
        "operational_status":  "OK",
        "file_system_type":  "NTFS",
        "quotas_rebuilding":  false,
        "block_size":  4096,
        "boot_volume":  true,
        "health_status":  "Healthy",
        "size":  499581448192,
        "maximum_file_name_length":  255,
        "automount":  true,
        "page_file_present":  true,
        "supports_disk_quotas":  true,
        "supports_file_based_compression":  true,
        "quotas_enabled":  false,
        "size_remaining":  413609037824,
        "quotas_incomplete":  false,
        "dedup_mode":  "NotAvailable"
    }
]
```
