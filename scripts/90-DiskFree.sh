sudo -E swapoff -a
sudo -E rm -f /swapfile
sudo -E docker image prune -a -f
sudo -E snap set system refresh.retain=2
sudo -E apt-get -y purge azure* dotnet* firefox ghc* google* hhvm llvm* mono* mysql* openjdk* php* zulu*
sudo -E apt-get -y autoremove --purge
sudo -E apt-get clean
sudo -E rm -rf /usr/share/dotnet /usr/local/lib/android/sdk /etc/mysql /etc/php /usr/local/share/boost
[ -n "$AGENT_TOOLSDIRECTORY" ] && sudo rm -rf "$AGENT_TOOLSDIRECTORY"