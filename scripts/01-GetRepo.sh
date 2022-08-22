rls_tag="20220716"
rls_file="https://github.com/coolsnowwolf/lede/archive/refs/tags/${rls_tag}.zip"

wget ${rls_file} -O lede.zip
unzip lede.zip
mv lede-${rls_tag} lede

echo "rls_tag=${rls_tag}" >> $GITHUB_ENV