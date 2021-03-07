#!/bin/bash

# create directories
mkdir -p /var/log/amazon/ssm
mkdir -p /etc/amazon/ssm

# clone the repo
git clone https://github.com/surajnarwade/flatcar-ssm /tmp/flatcar-ssm

# copy binaries
cp -rf /tmp/flatcar-ssm/bin/linux_amd64/* /usr/bin

# copy amazon ssm agent json
cp  /tmp/flatcar-ssm/bin/amazon-ssm-agent.json.template /etc/amazon/ssm/amazon-ssm-agent.json
