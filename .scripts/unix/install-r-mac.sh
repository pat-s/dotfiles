#! /bin/bash

R_VERSION=$1

curl -O https://mac.r-project.org/el-capitan/R-${R_VERSION}-branch/R-${R_VERSION}-branch-el-capitan-sa-x86_64.tar.gz

sudo tar fvxz R*.tar.gz -C /

rm R*.tar.gz
