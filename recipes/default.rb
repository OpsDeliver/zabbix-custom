#
# Cookbook Name:: zabbix-custom
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{
  mysql-devel
}.each do |package_name|
    package package_name do
    action :install
  end
end
