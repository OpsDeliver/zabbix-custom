# ipa-gothic-fonts のインストール
package "ipa-gothic-fonts" do
  case node["platform_family"]
  when 'rhel', 'fedora', 'arch', 'freebsd', 'suse'
    package_name "ipa-gothic-fonts"
  when "debian", "ubuntu"
    package_name "fonts-ipafont-gothic"
  end
  action :install
end

# 日本語 Font のコピー
execute "copy files" do
	case node["platform_family"]
  when 'rhel', 'fedora', 'arch', 'freebsd', 'suse'
	  command "cp /usr/share/fonts/ipa-gothic/ipag.ttf #{node[:zabbix][:web_dir]}/fonts/ipag.ttf"
	  creates "#{node[:zabbix][:web_dir]}/fonts/ipag.ttf"
  when "debian", "ubuntu"
	  command "cp /usr/share/fonts/truetype/fonts-japanese-gothic.ttf #{node[:zabbix][:web_dir]}/fonts/ipag.ttf"
	  creates "#{node[:zabbix][:web_dir]}/fonts/ipag.ttf"
  end
end

if node["platform_family"] == 'debian'
	execute "set JP font" do
		command "locale-gen ja_JP && dpkg-reconfigure locales"
	end
end

# defines.inc.php の編集
execute "modify-defines.inc.php" do
  command "sed -i \"s/'DejaVuSans'); /'ipag'); /\" #{node[:zabbix][:web_dir]}/include/defines.inc.php"
end

