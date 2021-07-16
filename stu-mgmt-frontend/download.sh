#!/bin/bash

set -e

curl -LO https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_StudentMgmt-Client/lastSuccessfulBuild/artifact/Client-Root.tar.gz
tar -xf Client-Root.tar.gz
