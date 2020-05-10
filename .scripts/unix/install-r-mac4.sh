#!/bin/bash

R_VERSION=$1

curl -O https://mac.r-project.org/high-sierra/R-${R_VERSION}-branch/x86_64/R-${R_VERSION}-branch.tar.gz

sudo tar fvxz R*.tar.gz -C /

rm R*.tar.gz
