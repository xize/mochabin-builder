# mochabin-builder
This is a private builder I use this only for my own specific hardware use case. DO NOT USE.

# Only use this builder when your hardware and partition layout is smilliar as mine or do not re-attempt to use builds using this tool!
what you need:

## pre-partitioning:

- the external m.2 drive has to be ext4 filesystem and has to be pre-formated to /dev/sda1 and /dev/sda2 prefered:
  dev1: 1gb, dev2: remaining space (1tb disk total)
  
  you can do this with ``fdisk /dev/sda`` and ``mkfs.ext4 /dev/sda1`` ``mkfs.ext4 /dev/sda2`` you can also install ``blkid`` to see a list of uuids and drives. 
  
- the previous firmware has to be mounted on ``/overlay -> /dev/sda1`` and ``/opt -> /dev/sda2``
- the builder only compiles the necessary configuration and packages, this means you need to be 100% sure your uuids match in fstab before upgrading to a image and then install the overall packages, you can find the location of the fstab file here /files/etc/config/fstab edit this for your own uuid before using the compiled image.

  the overall packages include:
  ``opkg update``
  ``opkg install luci-app-wireguard luci-app-nextdns luci-app-qos luci-app-sqm luci-app-pbr``
  
  and you need to manual install the nginx-all package from the pre-compiled folder.
  this nginx package has been compiled with the caching flag, the configuration was already pre-defined for the steam cache in the compilation of the image and the dnsmasq config to replace ``/.steamcontent.com/`` with ``0.0.0.0`` aswell in ``/etc/dnsmasq.conf``.

## ISP

this configuration is made for KPN, you need to add your own macaddress in like ``00-00-00-00@kpn`` as wan pppoe username, with password ``ppp`` your wan device needs to be spoofing the macaddress of your modem to be sure you are not temporary blocked.

br-iptv and igmproxy are already pre-configured and should work out of the box on lan.

wireguard however is not.

## wireless

- in my builds I have used AW7915-NPD and AW7915-NP1 as wireless cards provided by asiarf, ``kmod-mt7915E`` is used along with ``cfg80211`` for linux maintenance these should be pre-installed in the compiled images..
