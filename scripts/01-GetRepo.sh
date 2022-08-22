rls_tag="20220716"
rls_file="https://github.com/coolsnowwolf/lede/archive/refs/tags/${rls_tag}.zip"

echo "Downloading file..."
wget ${rls_file} -O lede.zip > /dev/null 2>&1
echo "Decompressing..."
unzip lede.zip > /dev/null
mv lede-${rls_tag} lede

echo "rls_tag=${rls_tag}" >> $GITHUB_ENV