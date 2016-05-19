#
# Cookbook Name:: zmot_httpd
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#cookbook_file "/etc/httpd/conf/httpd.conf" do
#  source "httpd.conf"
#  mode "0644"
#end

cookbook_file "/etc/httpd/sites-available/dev.zmotauto.com.conf" do
  source "dev.zmotauto.com.conf"
  mode "0644"
end
execute "a2ensite dev.zmotauto.com.conf" do
  command "a2ensite dev.zmotauto.com.conf"
end

service 'httpd' do
  action [ :restart ]
end
