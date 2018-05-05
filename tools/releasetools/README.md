
Instructions for manually triggering full-ota:

1) Copy Non-HLOS images(if any) and pack them into the RADIO folder of
   target-files-*.zip

2) Copy the target-files-*.zip into android_compat/build/tools/releasetools
   directory of your tree.

3) 'cd' to android_compat/build/tools/releasetools

4) Run the command as follows:
   a) For block-based OTA:
      ./full_ota_manual.sh <target-files-*.zip> <rootfs_path> <file-system type> --block
      Example:
              ./full_ota_manual.sh target-files-ext4.zip \
              ../../../../poky/build/tmp-glibc/work/<*target/variant*>-oe-linux/machine-image/1.0-r0/rootfs \
              ext4 --block

   b) For file-based OTA:
      ./full_ota_manual.sh <target-files-*.zip> <rootfs_path> <file-system-type> -p system/ -c <fsconfig.conf's path>
      Example:
              ./full_ota_manual.sh target-files-ext4.zip \
              ../../../../poky/build/tmp-glibc/work/<*target/variant*>-oe-linux/machine-image/1.0-r0/rootfs \
              ext4 -p system/ -c \
              ../../../../poky/build/tmp-glibc/work/<*target/variant*>-oe-linux/machine-image/1.0-r0/rootfs/rootfs-fsconfig.conf
      Note that the "-p system/ -c <fsconfig.conf's path>" is to be passed only if
      the target uses fsconfig.conf (check if rootfs-fsconfig.conf exists at rootfs's path).
      If not present, avoid passing "-p" and "-c" options.


Instructions for manually triggering incremental ota:

1) Copy Non-HLOS images(if any) and pack them into the RADIO folder of
   destination-builds's target-files-*.zip

2) Copy the target-files-*.zip (both base and destination) into
   android_compat/build/tools/releasetools directory of your tree.
   Lets call them v1.zip(base) and v2.zip(base)

3) 'cd' to android_compat/build/tools/releasetools

4) Run the command as follows:
   a) For block-based OTA:
      ./incremental_ota_manual.sh v1.zip v2.zip <rootfs_path> <file-system type> --block
      Example:
              ./incremental_ota_manual.sh v1.zip v2.zip \
              ../../../../poky/build/tmp-glibc/work/<varies based on target & build variant>/machine-image/1.0-r0/rootfs \
              ext4 --block

   b) For file-based OTA:
      ./incremental_ota_manual.sh v1.zip v2.zip <rootfs_path> <file-system-type> -p system/ -c <fsconfig.conf's path>
      Example:
              ./incremental_ota_manual.sh v1.zip v2.zip \
              ../../../../poky/build/tmp-glibc/work/<varies based on target & build variant>/machine-image/1.0-r0/rootfs \
              ext4 -p system/ -c \
              ../../../../poky/build/tmp-glibc/work/<*target/variant*>-oe-linux/machine-image/1.0-r0/rootfs/rootfs-fsconfig.conf
      Note that the "-p system/ -c <fsconfig.conf's path>" is to be passed only if
      the target uses fsconfig.conf (check if rootfs-fsconfig.conf exists at rootfs's path).
      If not present, avoid passing "-p" and "-c" options.


