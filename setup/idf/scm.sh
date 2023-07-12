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
# Description               : This setup script is used to clone the IA repo
# Last Modified by          : aminuddin.jamaluddin@intel.com
# Last Modified Date        : 03/03/2023
# version                   : 0.0.3
# Wiki Link                 : https://wiki.ith.intel.com/display/SegEth/Zephyr+Developer+Tests

function header () {
    echo "Initiate SCM Cloning"
}

function clone () {
    cd ${WORKSPACE}
    mkdir zephyr_ia_build_repo
    cd zephyr_ia_build_repo

    echo "Cloning Zephyr-IA"
    git clone -b rpl_dev https://github.com/intel-innersource/os.rtos.zephyr.iot.zephyr-ia.git zephyr-ia
    west init -l zephyr-ia
    west update

    cd ${WORKSPACE}/zephyr_ia_build_repo/zephyr-iotg
    git fetch intel
    west update

    cd ${WORKSPACE}/zephyr_ia_build_repo/zephyr
    git fetch intel
    west update

    cd ${WORKSPACE}
    git clone https://github.com/intel-sandbox/frameworks.validation.automation.gbe.tsn-zephyr.git ci_repo
    cd ${WORKSPACE}/ci_repo
    git init
    git checkout remotes/origin/dev_test -b dev_test
}

header
clone
