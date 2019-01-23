#!/bin/bash

if [ "`lsmod | grep nvidia`" ]; then
	echo "Nvidia driver already loaded!" >&2
	exit 1
fi

sudo modprobe ipmi_msghandler
path="`find /lib/modules/$(uname -r) -name nvidia.ko`"

if [ ! "$path" ]; then
	echo "Cannot find nvidia.ko in /lib/modules/$(uname -r)" >&2
	exit 1
fi

sudo insmod $path

if [ $? == 0 ]; then
	echo "Nvidia driver started successfully!"
else
	echo "Nvidia driver failed to start!"
fi
