# zephyr-i226
Jenkins Build setup for the zephyr i226 Repo

## Test Job
  - [ZEPHYR-I226-BUILD](https://cbjenkins-pg.devtools.intel.com/teams-iotgdevops01/job/iotgdevops01/job/ESC/job/UKALLA/job/JI_1509/job/ZEPHYR-I226-BUILD)


## Sample Jenkins Job
  - [EHL-ZEPHYR.IA-TSN-CI-PCT](https://cbjenkins-pg.devtools.intel.com/teams-iotgdevops01/job/iotgdevops01/job/EHL-ZEPHYR.IA-TSN-CI-PCT)

## Sample Script
  - [Jenkins Script File](https://github.com/intel-innersource/libraries.devops.jenkins.cac/blob/master/cac/ehl/zephyr-ia/tsn/Jenkinsfile.build)
  - [IDF Folder](https://github.com/intel-innersource/libraries.devops.jenkins.cac/tree/master/cac/ehl/zephyr-ia/tsn/idf)
  - [Docker File](https://github.com/intel-innersource/libraries.devops.jenkins.cac/blob/master/cac/ehl/zephyr-ia/tsn/Dockerfile.build)

## Changes from DevOps team
  - Create a test job exactly same as another Zephyr IA job.
  - Create dev branch for all the jenkinsfile and build script.
  - Let developer have permission to make changes on the dev branch.
  - Optional – if no permission: Use other repo which developer has access to upload the files and we clone those file into the job. 

## Developer Work
Devloper as to do following work

  - A test job they can trigger,  and scm.sh and build.sh files they can make changes.

  -  So, developer has a way to self-service the change the job based on what they need. 
