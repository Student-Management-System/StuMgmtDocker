#!/bin/bash

set -e

curl -LO https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_StudentMgmt-Backend/lastSuccessfulBuild/artifact/Backend.tar.gz
tar -xf Backend.tar.gz
