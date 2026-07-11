#!/bin/bash

set -e

systemctl enable sshd
systemctl restart sshd