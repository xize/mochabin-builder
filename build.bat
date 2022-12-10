#!/bin/sh

while getopts c flag
do
    case "${flag}" in
        c) configurationfile=${OPTARG};;
    esac
done

if [! -z "$configurationfile"];
then
    if [! -z directory_exists('openwrt') ]; then
	do
	  git clone https://github.com/xize/mochabin-openwrt openwrt
	fi
	
	cd openwrt
	git fetch
	git pull origin
	
	# TODO: add a way to load a .config into the make command as a argument or... if it doesnt auto checkout repo version then we should use something like yaml to read easily and reset feeds ourselfs.
	# we want as much of version control needed.
elif
	echo 'no configuration file set!, use `-c name` to set a configuration.'
fi