# meta-luciddg-kiosk

This is a layer that provides customizations specific to the web kiosk used by
Lucid Design Group, and which is based on the SolidRun CuBox-i family of hardware.

Specific tweaks include:
* Automatic mounting of u-boot FAT partition (`/dev/mmcblk0p1`) on `/media` (see `fstab`) at boot time
* Inclusion of firmware and assocated nvram configurations for Broadcom WiFi hardware, automatically starting WiFi at boot, and automatic assocation with the SSID configured in `/media/browser.conf`
* Starting Xorg with no cursor (because touchscreen)
* Inclusion of example/template `browser.conf` and `wifi.conf` in u-boot FAT partition
* Removal of dependency on anything having to do with ssh(d)

## The `browser.conf` and `wifi.conf` files

`browser.conf` is a [Midori](http://midori-browser.org/) configuration file. Documentation of this file is lacking.

`wifi.conf` is a [WPA Supplicant](http://w1.fi/cgit/hostap/plain/wpa_supplicant/wpa_supplicant.conf) configuration file.

## How to update configuration files

The default/example/template configuration lives in `recipes-bsp/u-boot/u-boot-cubox-i/wifi.conf`.

### wifi.conf

This file should be fairly easy to understand. It looks like:
```
network={
  ssid="WIFI_NAME"

  # For WPA-PSK
  psk="PASSWORD"

  # For WPA-Enterprise
  #scan_ssid=1
  #key_mgmt=WPA-EAP
  #identity="USERNAME"
  #password="PASSWORD"
  #eap=PEAP
  #phase1="peaplabel=0"
  #phase2="auth=MSCHAPV2"
}
```

A customer's network will be one of two types: WPA-PSK or WPA Enterprise. No site is both! You can delete lines that don't apply to your installation. The customer's network administrator should be able to provide suitable values for both sections.

### browser.conf

This file configures two main things: the startup webpage, and any proxy settings that may be required.

#### Startup webpage

The line
> `homepage=https://www.buildingos.com/`
is where you want to change this setting. Any URL will work as long as the URL isn't password protected.

#### Proxy settings

The lines
```
#proxy-type=MIDORI_PROXY_HTTP
#http-proxy=proxy_address
#http-proxy-port=port_number
```
change whether the browser attempts to use a proxy to reach the Internet. The customer's network administrator should be able to provide settings for `http-proxy` and `http-proxy-port`. You'll need to uncomment all three lines in order to activate them. If you don't need them, you may delete them.

