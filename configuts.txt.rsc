# jan/02/1970 00:22:56 by RouterOS 6.48.6
# software id = XF27-WJ41
#
# model = RB941-2nD
# serial number = A1C30BB18CA4
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.99.2-192.168.99.6
add name=dhcp_pool1 ranges=192.168.77.2-192.168.77.14
add name=dhcp_pool2 ranges=192.168.66.2-192.168.66.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=ether3 name=dhcp2
add address-pool=dhcp_pool2 disabled=no interface=ether4 name=dhcp3
/ip address
add address=192.168.99.1/29 interface=ether2 network=192.168.99.0
add address=192.168.77.1/28 interface=ether3 network=192.168.77.0
add address=192.168.66.1/32 interface=ether4 network=192.168.66.0
/ip dhcp-client
add interface=ether1 disabled=no
/ip dhcp-server network
add address=192.168.99.0/29 gateway=192.168.99.1
add address=192.168.77.0/28 gateway=192.168.77.1
add address=192.168.66.0/32 gateway=192.168.66.1
/routing rip interface
add interface=ether2
add interface=ether3
add interface=ether4
/routing rip network
add network=192.168.99.0/29
add network=192.168.77.0/28
add network=192.168.66.0/32
