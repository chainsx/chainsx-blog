---
layout: post
title: "LicheePi Zero通过sdio0使用r8723bs"
quote: "LicheePi Zero通过sdio0使用r8723bs"
image: false
video: false
comments: true
---

# LicheePi Zero通过sdio0使用r8723bs

## 首先获取u-boot源码:             

`git clone https://github.com/Lichee-Pi/u-boot.git -b v3s-current`

### 修改 include/configs/sun8i.h, 使u-boot可以直接从tf卡启动：

```
#define CONFIG_BOOTCOMMAND   "setenv bootm_boot_mode sec; " \
                            "load mmc 0:1 0x41000000 zImage; "  \
                            "load mmc 0:1 0x41800000 sun8i-v3s-licheepi-zero-dock.dtb; " \
                            "bootz 0x41000000 - 0x41800000;"

#define CONFIG_BOOTARGS      "console=ttyS0,115200 panic=5 rootwait root=/dev/mmcblk0p2 earlyprintk rw  vt.global_cursor_default=0"
```
### 编译u-boot

`cd u-boot`

```
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make LicheePi_Zero_defconfig

ARCH=arm make menuconfig

ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make
```

## 获取Linux源码(zero-4.13.y分支对网卡支持比较好):  

`git clone https://github.com/Lichee-Pi/linux.git -b zero-4.13.y`

### 生成荔枝派Zero 默认配置文件： 
`CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm make licheepi_zero_defconfig`

### 设备树文件：  
arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts

#### 删掉led相关，因为led占用了pg1-2，影响了sdio0，

### 配置

`make ARCH=arm menuconfig`

#### 勾上r8723bs

### 编译内核:     

`make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -j1`

## 注意使用sun8i-v3s-licheepi-zero-dock.dtb才能使能wlan0

