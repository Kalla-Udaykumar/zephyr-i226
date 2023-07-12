
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

# Created by                : aminuddin.jamaluddin@intel.com
# Description               : This setup script is used to build the sample application
# Last Modified by          : aminuddin.jamaluddin@intel.com
# Last Modified Date        : 03/03/2023
# version                   : 0.0.3
# Wiki Link                 : https://wiki.ith.intel.com/display/SegEth/Zephyr+Developer+Tests

platform=$1
apps="base_eth"

function header () {
    echo "Initiate Build for "${apps}
}

function installer() {
    echo "Adding Dependency:"
    cd ${WORKSPACE}
    pip3 install pyelftools
}

function copy_app () {
    cd ${WORKSPACE}/ci_repo/sample_app/
    cp -r ${apps} ${WORKSPACE}/zephyr_ia_build_repo/zephyr/samples/net/
    cd ${WORKSPACE}/zephyr_ia_build_repo/zephyr/samples/net/${apps}
    ls -la | grep ${apps}
    echo "Copying Success"
}

function build_app () {
    cd ${WORKSPACE}/zephyr_ia_build_repo/zephyr
    source ./zephyr-env.sh
    echo "Sample app build in progress"
    if [ $apps == "base_eth" ]; then
        west build -d ${WORKSPACE}/zephyr_ia_build_repo/build/${apps}/ -p -b $platform ${WORKSPACE}/zephyr_ia_build_repo/zephyr/samples/net/base_eth
    #elif [ $apps == "tsn" ]; then
    #    echo "tsn"
    #    west build -d ../build/${apps}/ -p -b $platform ${WORKSPACE}/zephyr_ia_build_repo/zephyr/samples/net/tsn
    else
        echo "Sample apps does not exist"
        exit 0
    fi

    # if [ ! -d "${WORKSPACE}/zephyr_ia_build_repo/build/${apps}" ]; then
    #     echo "Build Failed"
    #     exit 0
    # fi

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
    cd ${WORKSPACE}
    [ ! -d "upload" ] && mkdir "upload"
    cd upload
    cp -r ${WORKSPACE}/zephyr_ia_build_repo/build/${apps}/zephyr/zephyr.efi .
}

header
installer
copy_app
build_app
