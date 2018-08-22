#!/bin/sh

# Make sure everything is up to date
yum update -y

# Enable Xen repository + dev tools
yum install -y centos-release-xen sudo passwd bzip2 patch nano which tar wget \
xz libvirt libvirt-daemon-xen
yum groupinstall -y "Development Tools"

# Xen4 provides an updated kernel; pull in the new kernel in:
yum update -y

# Install Xen itself
yum install -y xen

# Force update GRUB
grub-bootxen.sh
