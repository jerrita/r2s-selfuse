# Using SDK

# rls_code="21.02.3"
# sdk_name="openwrt-sdk-21.02.3-rockchip-armv8_gcc-8.4.0_musl.Linux-x86_64"

rls_code="22.03.0-rc6"
# sdk_name="openwrt-sdk-22.03.0-rc6-rockchip-armv8_gcc-11.2.0_musl.Linux-x86_64"
# sdk_file="https://downloads.openwrt.org/releases/${rls_code}/targets/rockchip/armv8/${sdk_name}.tar.xz"

# echo "Downloading SDK..."
# wget ${sdk_file} -O sdk.tar.xz > /dev/null 2>&1
# echo "Decompressing..."
# tar xf sdk.tar.xz
# mv ${sdk_name} openwrt-sdk

echo "Getting Repo..."
git clone https://github.com/openwrt/openwrt -b openwrt-22.03 --depth=1

# Patch feeds
# Seems donnot need sfe in 21.03
# echo "src-svn acc https://github.com/imy7/luci-app-turboacc/trunk/Lean" >> openwrt/feeds.conf.default
mkdir -p openwrt/package/feeds/extra
cd openwrt/package/feeds/extra \
 && git clone https://github.com/mchome/luci-app-vlmcsd \
 && git clone https://github.com/mchome/openwrt-vlmcsd \
 && git clone https://github.com/rufengsuixing/luci-app-zerotier

echo "rls_tag=${rls_code}" >> $GITHUB_ENV