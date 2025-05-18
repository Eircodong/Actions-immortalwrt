#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile

# 删除插件
rm -rf feeds/packages/net/adguardhome

# 添加插件
git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky
git clone --depth=1 -b master https://github.com/xiaoxiao29/luci-app-adguardhome package/luci-app-adguardhome
git clone https://github.com/sirpdboy/luci-app-taskplan package/luci-app-taskplan

# mosdns
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f

git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# istore
git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci package/nas-packages-luci
git clone --depth=1 -b master https://github.com/linkease/nas-packages package/nas-packages
git clone --depth=1 -b main https://github.com/linkease/istore package/istore

# uugamebooster
git clone https://github.com/kiddin9/luci-app-uugamebooster package/luci-app-uugamebooster
git clone https://github.com/Eircodong/packages-uugamebooster package/uugamebooster
