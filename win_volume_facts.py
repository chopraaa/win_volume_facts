#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: (c) 2018 Varun Chopra <v@chopraaa.com>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

ANSIBLE_METADATA = {'metadata_version': '1.1',
                    'status': ['preview'],
                    'supported_by': 'community'}

DOCUMENTATION = r'''
---
module: win_volume_facts
version_added: '2.6'
short_description: Show the volumes and volume information of the host.
description:
   - With the module you can retrieve and output detailed information about the
     volumes present on the target.
author:
    - Varun Chopra <v@chopraaa.com>
notes:
  - In order to understand all the returned properties and values please visit
    the following site and open the respective MSFT class
    U(https://msdn.microsoft.com/en-us/library/aa394515(v=vs.85).aspx)
'''

EXAMPLES = r'''
- name: Get disk facts
  win_disk_facts:

- debug:
    msg: "{{ item.size | filesizeformat(True) }}"
  when: '"C" in item.drive_letter'
  with_items: "{{ ansible_facts.win_volume }}"

'''

RETURN = r'''
ansible_facts:
    description: Dictionary containing all the detailed information about the disks of the target.
    returned: always
    type: complex
    contains:
        ansible_win_volume:
            description: Detailed information about all volumes present.
            returned: if existent
            type: list
            contains:
                automount:
                    description:
                        - If true, the volume is mounted to the file system
                          automatically when the first I/O is issued. If false,
                          the volume is not mounted until explicitly mounted by
                          using the Mount method, or by adding a drive letter
                          or mount point.
                    returned: always
                    type: boolean
                    sample: true
                block_size:
                    description:
                        - Size in bytes of the blocks in this storage extent.
                    returned: always
                    type: int
                    sample: 4096
                boot_volume:
                    description:
                        - The BootVolume property indicates whether the volume
                          contains the currently running operating system files.
                    returned: always
                    type: boolean
                    sample: true
                device_id:
                    description:
                        - Unique identifier for the volume on this system.
                    returned: always
                    type: string
                    sample: "\\\\?\\Volume{649b39c5-46cb-11e8-85a6-806e6f6e6963}\\"
                drive_letter:
                    description:
                        - The DriveLetter property indicates the drive letter
                          assigned to the volume. This property is NULL for
                          volumes without drive letters.
                    returned: always
                    type: boolean
                    sample: "C"
                drive_type:
                    description:
                        - The DriveType property contains a numeric value
                          corresponding to the type of disk drive this logical
                          disk represents.

                          Example: A CD-ROM drive would return 5.
                    returned: always
                    type: int
                    sample: 5
                label:
                    description:
                        - Volume name of the logical disk.
                    returned: always
                    type: string
                    sample: "Windows"
                maximum_file_name_length:
                    description:
                        - Maximum length, in characters, of a filename component
                          supported by a Windows drive.
                    returned: always
                    type: int
                    sample: 255
                page_file_present:
                    description:
                        - boot volume
                    returned: always
                    type: boolean
                    sample: true
                quotas_enabled:
                    description:
                        - boot volume
                    returned: always
                    type: boolean
                    sample: true
                quotas_incomplete:
                    description:
                        - boot volume
                    returned: always
                    type: boolean
                    sample: true
                quotas_rebuilding:
                    description:
                        - boot volume
                    returned: always
                    type: boolean
                    sample: true
                serial_number:
                    description:
                        - boot volume
                    returned: always
                    type: boolean
                    sample: true
                size:
                    description:
                        - Size of the volume in bytes.
                    returned: always
                    type: int
                    sample: 53684989952
                size_remaining:
                    description:
                        - boot volume
                    returned: always
                    type: int
                    sample: 37904646144
                supports_disk_quotas:
                    description:
                        - boot volume
                    returned: always
                    type: boolean
                    sample: true
                supports_file_based_compression:
                    description:
                        - boot volume
                    returned: always
                    type: boolean
                    sample: true
                system_volume:
                    description:
                        - boot volume
                    returned: always
                    type: boolean
                    sample: true
                type:
                    description:
                        - boot volume
                    returned: always
                    type: boolean
                    sample: true
'''
