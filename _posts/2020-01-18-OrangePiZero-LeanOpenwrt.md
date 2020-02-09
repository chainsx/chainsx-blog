---
layout: post
title: "OrangePi Zero的openwrt"
quote: "使用lean大的openwrt支持ap"
image: false
video: false
comments: true
---

# OrangePi Zero使用lean大的openwrt支持xr819

### Openwrt官方的镜像不支持xradio，也就是不能开启wifi，所以我对lean大的openwrt的源码打上xr819的补丁来支持。
#### 附源码地址，方便查找。

[XR819 Patch](https://github.com/melsem/openwrt-lede_xradio-xr819_soc-audio)
[lean openwrt](https://github.com/coolsnowwolf/lede)

## 编译过程
### 克隆openwrt源码

`git clone https://github.com/coolsnowwolf/lede`

`cd lede`

### 下载所需文件

```
./scripts/feeds update -a 
./scripts/feeds install -a
```

### 下载补丁

```
wget https://raw.githubusercontent.com/melsem/openwrt-lede_xradio-xr819_soc-audio/master/add-SOC_AUDIO-usb2-usb3-opi_zero_openwrt(lede)-18.06.xx/add-SOC_AUDIO-usb2-usb3-opi_zero_openwrt-18.06.xx.patch

wget https://raw.githubusercontent.com/melsem/openwrt-lede_xradio-xr819_soc-audio/master/add-SOC_AUDIO-usb2-usb3-opi_zero_openwrt(lede)-18.06.xx/add-on_wifi-mac80211.patch

wget https://raw.githubusercontent.com/melsem/openwrt-lede_xradio-xr819_soc-audio/master/packages_xradio-OpenWrt(Lede)-18.06.xx/add-patch_dts_file-wifi-xradio.patch
```

### 打补丁

```
patch -p1 < add-SOC_AUDIO-usb2-usb3-opi_zero_openwrt-18.06.xx.patch
patch -p1 < add-on_wifi-mac80211.patch
patch -p1 < add-patch_dts_file-wifi-xradio.patch
```

### 配置，选中xr819 test drivers

`make menuconfig` 

### 编译(单核编译)

`make V=s -j1`

## 附上编译好的文件

[OrangePi Zero Lean Openwrt with xr819](http://dl.chainsx.cn/bin/targets/sunxi/cortexa7/openwrt-sunxi-cortexa7-sun8i-h2-plus-orangepi-zero-ext4-sdcard.img.gz)

## 存在的问题
* wan口不能默认dhcp，建议新增接口lan来作为无线的dhcp服务器，将wan口设为dhcp

在第一次上电开机后改/etc/config/network
```
config interface 'loopback'
        option ifname 'lo'
        option proto 'static'
        option ipaddr '127.0.0.1'
        option netmask '255.0.0.0'

config globals 'globals'
        option ula_prefix 'fd98:a9fe:0dbe::/48'

config interface 'lan'
        option type 'bridge'
        option ifname 'wlan0'
        option proto 'static'
        option ipaddr '192.168.4.1'
        option netmask '255.255.255.0'
        option ip6assign '60'

config interface 'wan'
        option ifname 'eth0'
        option proto 'dhcp'

config interface 'vpn0'
        option ifname 'tun0'
        option proto 'none'
```
* 热点不会默认开放，ap默认不能使用，需要将工作频率-模式改为传统

改/etc/config/wirless，删掉以下行

```
option htmode 'HT20'
```
