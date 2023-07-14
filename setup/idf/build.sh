
#!/bin/bash
# Copyright (C) 2023 Intel Corporation
# This software and the related documents are Intel copyrighted materials, and
# your use of them is governed by the express license under which they were
# provided to you ("License"). Unless the License provides otherwise, you may not
# use, modify, copy, publish, distribute, disclose or transmit this software or
# the related documents without Intel's prior written permission.
# This software and the related documents are provided as is, with no express or
# implied warranties, other than those that are expressly stated in the License.
#-------------------------------------------------------------------------------

# Created by                : muhammad.husaini.zulkifli@intel.com
# Description               : This setup script is used to clone the IA repo
# Last Modified by          : muhammad.husaini.zulkifli@intel.com
# Last Modified Date        : 13/07/2023
# version                   : 0.0.1
# Wiki Link                 : https://wiki.ith.intel.com/x/RJvns

platform=$1
apps="echo_server"

function header () {
    echo "Initiate Build for "${apps}
    pip install pyelftools
}

function build_app () {
    cd ${WORKSPACE}/zephyr_ia_build_repo/zephyr
    source zephyr-env.sh
    echo "Sample app build in progress"
    if [ $apps == "echo_server" ]; then
	west build -d ${WORKSPACE}/zephyr_ia_build_repo/build/${apps} -p -b $platform ${WORKSPACE}/zephyr_ia_build_repo/zephyr/samples/net/sockets/${apps}/ -- -DOVERLAY_CONFIG=${WORKSPACE}/zephyr_ia_build_repo/zephyr/overlay-ehl.conf $OPTION
    else
        echo "Sample apps does not exist"
        exit 0
    fi
    
    echo "Sample app build in progress final staging"

    if [ ! -d "${WORKSPACE}/zephyr_ia_build_repo/build/${apps}" ]; then
         echo "Build Failed"
         exit 0
    fi

    echo "Build Success for: "${apps}
    echo "Copy Binary to upload folder"
    cd ${WORKSPACE}/zephyr_ia_build_repo/build/${apps}/zephyr
    echo "Location:"
    pwd
    ls -la
    if [ -f "zephyr.efi" ]; then
        echo "Binary exist"
    else
        echo "Error: zephyr.efi not found. Unable to continue."
        exit 0
    fi
}

header
build_app
