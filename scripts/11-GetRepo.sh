# Using SDK

rls_code="21.02.3"
sdk_name="openwrt-sdk-21.02.3-rockchip-armv8_gcc-8.4.0_musl.Linux-x86_64"
sdk_file="https://downloads.openwrt.org/releases/${rls_code}/targets/rockchip/armv8/${sdk_name}.tar.xz"

echo "Downloading SDK..."
wget ${sdk_file} -O sdk.tar.xz
echo "Decompressing..."
tar xf sdk.tar.xz
mv ${sdk_name} openwrt

# Patch feeds
echo "src-svn acc https://github.com/imy7/luci-app-turboacc/trunk/Lean" >> openwrt/feeds.conf.default
mkdir -p openwrt/package/feeds/extra
cd openwrt/package/feeds/extra && git clone https://github.com/mchome/luci-app-vlmcsd
cd openwrt/package/feeds/extra && git clone https://github.com/mchome/openwrt-vlmcsd
cd openwrt/package/feeds/extra && git clone https://github.com/rufengsuixing/luci-app-zerotier

echo "rls_tag=${rls_code}" >> $GITHUB_ENV