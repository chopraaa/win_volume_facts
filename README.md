# win_volume_facts

Ansible module for getting volume facts.

- Works for Windows 2003 and over. Doesn't display `dedup_mode`, `health_status`, `operational_status` and `object_id` for legacy systems however. Anything older than 2012 is deemed legacy.

  This is because the module uses the `MSFT_Volume` class to get these values, and they were added with `Get-Volume` I think.
  
- The `device_id` value can be used further to format or remove volumes.

```yaml
  ansible_facts.win_volumes[0]:
    automount: true
    block_size: 4096
    boot_volume: true
    dedup_mode: null
    device_id: \\?\Volume{d2962143-4637-11e8-822a-806e6f6e6963}\
    drive_letter: C
    drive_type: 3
    file_system_type: NTFS
    friendly_name: null
    health_status: null
    maximum_file_name_length: 255
    object_id: null
    operational_status: null
    page_file_present: true
    quotas_enabled: false
    quotas_incomplete: false
    quotas_rebuilding: false
    serial_number: 3831722921
    size: 53684989952
    size_remaining: 32338526208
    supports_disk_quotas: true
    supports_file_based_compression: true
    system_volume: true
```
