#!/bin/sh

# arg1 = mmc
# arg2 = sda
# arg3 = sda1
# arg4 = sda2

$mmc = ''
$sda = ''
$sda1 = ''
$sda2 = ''

generate_fstab_config() {
	$mmc =  $(cut -d ' ' -f 2 << $1)
	$sda =  $(cut -d ' ' -f 2 << $2)
	$sda1 =  $(cut -d ' ' -f 2 << $3)
	$sda2 =  $(cut -d ' ' -f 2 << $4)

	#this concept needs to be tested. #
	
	echo ${cat config_placeholders/fstab.conf} > ../files/etc/config/fstab 
}
