# ipa-gothic-fonts のインストール
package "ipa-gothic-fonts" do
  action :install
end

# 日本語 Font のコピー
execute "copy files" do
  command "cp /usr/share/fonts/ipa-gothic/ipag.ttf #{node[:zabbix][:web_dir]}/fonts/ipag.ttf"
  creates "#{node[:zabbix][:web_dir]}/fonts/ipag.ttf"
end

# defines.inc.php の編集
execute "modify-defines.inc.php" do
  command "sed -i \"s/'DejaVuSans'); /'ipag'); /\" #{node[:zabbix][:web_dir]}/include/defines.inc.php"
end

