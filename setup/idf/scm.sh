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

function header () {
    echo "Initiate SCM Cloning"
}

function clone () {
    cd ${WORKSPACE}
    mkdir zephyr_ia_build_repo
    cd zephyr_ia_build_repo

    echo "Cloning Zephyr-IA"
    west init -m https://github.com/intel-innersource/os.rtos.zephyr.iot.zephyr.git
    west update
    
    echo "Checkout to I226 3.4 Master Branch"
    cd zephyr
    git remote add I226 https://github.com/intel-innersource/os.rtos.zephyr.iot.zephyr-iotg-i225.git
    git remote update
    git checkout I226/dev/3.4_master
}

header
clone
