#!/bin/bash

set -e
set -o noclobber

mkdir /tmp/devops-test 2>/dev/null && echo "Directory created" || { echo "Directory already exists"; }

cd /tmp/devops-test


( > demo.txt ) 2>/dev/null && echo "File demo.txt created" || { echo "demo.txt file already exists"; }
