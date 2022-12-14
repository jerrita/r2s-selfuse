sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# 烦不烦啊
sed -i 's/src-git-full/src-git/g' feeds.conf.default

./scripts/feeds update -a
./scripts/feeds install -a

# We can edit this in menuconfig
sed -i 's,-mcpu=generic,-mcpu=cortex-a53+crypto,g' include/target.mk
sed -i 's/Os/O3 -funsafe-math-optimizations -funroll-loops -ffunction-sections -fdata-sections -Wl,--gc-sections/g' include/target.mk

# Irqbalance
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

# We can edit this in menuconfig
# sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
# sed -i 's/OpenWrt/TiSATO/g' package/base-files/files/bin/config_generate

# Swap wan & lan
sed -i 's,"eth1" "eth0","eth0" "eth1",g' target/linux/rockchip/armv8/base-files/etc/board.d/02_network
sed -i "s,'eth1' 'eth0','eth0' 'eth1',g" target/linux/rockchip/armv8/base-files/etc/board.d/02_network
