#!/bin/sh
# Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#     * Neither the name of The Linux Foundation nor the names of its
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# full_ota.sh      script to generate OTA upgrade pacakges.
#

if [ "$#" -ne 3 ]; then
    echo "Usage  : $0 target_files_zipfile target_name MMC_or_MTD"
    echo "------------------------------------------------------------------"
    echo "example: $0 target_files_ubi.zip mdm9640 MTD"
    exit 1
fi

export PATH=.:../../../../oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin:$PATH
export OUT_HOST_ROOT=.
export LD_LIBRARY_PATH=../../../../oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib

rm -rf target_files
unzip -qo $1 -d target_files
mkdir -p target_files/META
mkdir -p target_files/SYSTEM

zipinfo -1 $1 |  awk 'BEGIN { FS="SYSTEM/" } /^SYSTEM\// {print "system/" $2}' | ../../../../oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/fs_config -D ../../../../oe-core/build/tmp-eglibc/work/$2-oe-linux-gnueabi/mdm-image/1.0-r0/rootfs > target_files/META/filesystem_config.txt

cd target_files && zip -q ../$1 META/*filesystem_config.txt SYSTEM/build.prop && cd ..

./ota_from_target_files -p . -s "../../../../device/qcom/common" -f 1 -v $1 update.zip

rm -rf target_files
