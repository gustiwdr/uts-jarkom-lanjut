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
add name=dhcp_pool0 ranges=192.168.3.2-192.168.3.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether4 name=dhcp1
/ip address
add address=192.168.3.1/24 interface=ether4 network=192.168.3.0
add address=20.20.20.1/24 interface=ether2 network=20.20.20.0
add address=10.10.10.1/24 interface=ether3 network=10.10.10.0
/ip dhcp-server network
add address=192.168.3.0/24 gateway=192.168.3.1
/routing rip interface
add interface=ether2
add interface=ether3
add interface=ether4
/routing rip network
add network=192.168.3.0/24
add network=10.10.10.0/24
add network=20.20.20.0/24
