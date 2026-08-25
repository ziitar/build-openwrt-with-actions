# 请在下方输入自定义命令(一般用来安装第三方插件)(可以留空)

# 编辑默认的lan口ip地址
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

# 编辑默认的主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 编辑默认的luci显示的固件名称
#sed -i 's/OpenWrt/ZWRT/g' package/base-files/files/bin/config_generate
#sed -i 's/ImmortalWrt/ZWRT/g' package/base-files/files/bin/config_generate

# 设置 UA2F 开机自启
sed -i '/exit 0/i\/etc/init.d/ua2f start' /etc/rc.local

# 统一 TTL 值为 64 (防止多设备检测)
sed -i '/exit 0/i\iptables -t mangle -A POSTROUTING -j TTL --ttl-set 64' /etc/rc.local

# 添加 UA2F 插件源
git clone https://github.com/Zxilly/UA2F.git package/UA2F
