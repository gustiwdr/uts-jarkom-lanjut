# ESSAY

## SOAL 1

### Jelaskan menurut Anda apa itu Routing Static?

Routing static atau routing statis adalah teknik atau proses konfigurasi router jaringan yang dilakukan secara manual oleh operator/administrator jaringan. Contoh konfigurasi routing static: 

1. **Konfigurasi IP Address Mikrotik 1**
    - Pastikan Firewall pada laptop mati
    - Hubungkan ether2 Mikrotik 1 ke laptop A
    - Hubungkan ether1 Mikrotik 1 ke Mikrotik 2 
    - Buka Winbox dan hubungkan ke Mikrotik 1
    - Buka IP -> Addresses
    - Tambahkan IP address:
      - ether1 (terhubung ke Mikrotik 2): 192.168.100.1/24
      - ether2 (terhubung ke laptop A): 192.168.10.1/24

2. **Konfigurasi IP Address Mikrotik 2**
    - Pastikan Firewall pada laptop mati
    - Hubungkan ether2 Mikrotik 2 ke laptop B
    - Hubungkan ether1 Mikrotik 2 ke Mikrotik 1
    - Buka Winbox dan hubungkan ke Mikrotik 2
    - Buka IP -> Addresses
    - Tambahkan IP address:
      - ether1 (terhubung ke Mikrotik 1): 192.168.100.2/24
      - ether2 (terhubung ke laptop B): 192.168.1.1/24

3. **Konfigurasi DHCP Server**
    - DHCP Server pada Mikrotik 1
      - Buka IP -> DHCP Server
      - Klik DHCP Setup dan pilih interface ether2
      - Ketik **ipconfig** di terminal/cmd laptop untuk melihat IP lokal yang didapatkan
    - DHCP Server pada Mikrotik 2
      - Buka IP -> DHCP Server
      - Klik DHCP Setup dan pilih interface ether2
      - Ketik **ipconfig** di terminal/cmd laptop untuk melihat IP lokal yang didapatkan

4. **Setting Routing**
    - Routing di Mikrotik 1
      - Buka IP -> Routes
      - Tambahkan route baru:
        - Destination Address: 192.168.1.0/24 (network di ether2 Mikrotik 2)
        - Gateway: 192.168.100.2 (*IP di ether1 Mikrotik 2* yang terhubung dengan Mikrotik 1)
    - Routing di Mikrotik 2
      - Buka IP -> Routes
      - Tambahkan route baru:
        - Destination Address: 192.168.10.0/24 (network di ether2 Mikrotik 1)
        - Gateway: 192.168.100.1 (*IP di ether1 Mikrotik 1* yang terhubung dengan Mikrotik 2)

5. **Tes Koneksi**
    - Pastikan kedua laptop terhubung dengan benar ke masing-masing Mikrotik dan pastikan laptop sudah mendapatkan IP Address dari DHCP Server yang sudah diatur (cek di terminal menggunakan **ipconfig**)
    - Lakukan ping dari laptop A di jaringan Mikrotik 1 ke laptop B di jaringan Mikrotik 2
    - Jika semua konfigurasi benar, ping seharusnya berhasil


## SOAL 2

### Jelaskan menurut Anda apa itu Routing Dynamic?

Routing dynamic atau routing dinamis adalah teknik atau proses routing yang mana router akan membuat tabel routing secara otomatis berdasarkan informasi yang diterima dari router lain. Routing dynamic biasanya menggunakan RIP, BGP, atau OSPF. Contoh konfigurasi routing dynamic menggunakan RIP:

1. **Konfigurasi Mikrotik 1**
    - Pastikan Firewall pada laptop mati
    - Hubungkan ether1 Mikrotik 1 ke laptop A
    - Hubungkan ether2 Mikrotik 1 ke ether2 Mikrotik 2
    - Hubungkan ether3 Mikrotik 1 ke ether3 Mikrotik 3
    - Buka Winbox dan hubungkan ke Mikrotik 1
    - Buka IP -> Addresses
    - Tambahkan IP address:
      - ether1 (terhubung ke laptop A): 192.168.1.1/24
      - ether2 (terhubung ke Mikrotik 2): 10.10.10.1/30
      - ether3 (terhubung ke Mikrotik 3): 20.20.20.1/30
    - Buka IP -> DHCP Server
    - Klik DHCP Setup dan pilih interface ether1
    - Ketik **ipconfig** di terminal/cmd laptop untuk melihat IP lokal yang didapatkan
    - Buka Routing -> RIP
      - Pada tab Interfaces, tambahkan ether1, ether2, dan ether3
      - Pada tab Networks, tambahkan:
        - 192.168.1.0/24 (network ether1)
        - 10.10.10.0/24 (network ether2)
        - 20.20.20.0/24 (network ether3)
      - Pada tab Routes, cek rute yang terbentuk

2. **Konfigurasi Mikrotik 2**
    - Pastikan Firewall pada laptop mati
    - Hubungkan ether1 Mikrotik 2 ke laptop B
    - Hubungkan ether2 Mikrotik 2 ke ether2 Mikrotik 1
    - Buka Winbox dan hubungkan ke Mikrotik 1
    - Buka IP -> Addresses
    - Tambahkan IP address:
      - ether1 (terhubung ke laptop B): 192.168.2.1/24
      - ether2 (terhubung ke Mikrotik 1): 10.10.10.2/30
    - Buka IP -> DHCP Server
    - Klik DHCP Setup dan pilih interface ether1
    - Ketik **ipconfig** di terminal/cmd laptop untuk melihat IP lokal yang didapatkan
    - Buka Routing -> RIP
      - Pada tab Interfaces, tambahkan ether1, ether2, dan ether3
      - Pada tab Networks, tambahkan:
        - 192.168.2.0/24 (network ether1)
        - 10.10.10.0/24 (network ether2)
      - Pada tab Routes, cek rute yang terbentuk

3. **Konfigurasi Mikrotik 3**
    - Pastikan Firewall pada laptop mati
    - Hubungkan ether1 Mikrotik 3 ke laptop C
    - Hubungkan ether3 Mikrotik 3 ke ether3 Mikrotik 1
    - Buka Winbox dan hubungkan ke Mikrotik 1
    - Buka IP -> Addresses
    - Tambahkan IP address:
      - ether1 (terhubung ke laptop C): 192.168.3.1/24
      - ether3 (terhubung ke Mikrotik 1): 20.20.20.2/30
    - Buka IP -> DHCP Server
    - Klik DHCP Setup dan pilih interface ether1
    - Ketik **ipconfig** di terminal/cmd laptop untuk melihat IP lokal yang didapatkan
    - Buka Routing -> RIP
      - Pada tab Interfaces, tambahkan ether1, ether2, dan ether3
      - Pada tab Networks, tambahkan:
        - 192.168.3.0/24 (network ether1)
        - 20.20.20.0/24 (network ether3)
      - Pada tab Routes, cek rute yang terbentuk

4. **Tes Koneksi**
    - Pastikan ketiga laptop terhubung dengan benar ke masing-masing Mikrotik dan pastikan laptop sudah mendapatkan IP Address dari DHCP Server yang sudah diatur (cek di terminal menggunakan **ipconfig**)
    - Lakukan ping dari laptop A di jaringan Mikrotik 1 ke laptop B di jaringan Mikrotik 2 dan ke laptop C di jaringan Mikrotik 3 begitu pula sebaliknya
    - Jika semua konfigurasi benar, ping seharusnya berhasil


## SOAL 3

### Jelaskan menurut Anda apa itu Firewall?

Firewall adalah sistem yang berfungsi untuk mengizinkan lalu lintas jaringan yang aman dan mencegah lalu lintas jaringan yang tidak aman. Firewall bekerja sebagai filter/penyaring yang memantau lalu lintas jaringan yang masuk dan keluar.

## SOAL 4

### Jelaskan menurut Anda apa itu NAT?

NAT (Network Address Translation) adalah metode jaringan yang mengubah/menerjemahkan alamat IP lokal menjadi alamat IP publik, yang memungkinkan perangkat dalam jaringan internal untuk mengakses internet. NAT adalah salah satu fitur dari Firewall dan dapat digunakan untuk menghubungkan dua laptop (atau lebih) ke internet melalui satu koneksi yang disediakan oleh perangkat seperti router.

# STUDY CASE

Pada study case ini, saya melakukan konfigurasi sebagai Kampus_CR, mikrotik_CR.