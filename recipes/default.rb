#
# Cookbook Name:: zabbix-custom
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "mysql-devel" do
  case node["platform_family"]
  when 'rhel', 'fedora', 'arch', 'freebsd', 'suse'
    package_name "mysql-devel"
  when "debian", "ubuntu"
    package_name "libmysqlclient-dev"
  end
  action :install
end