include_recipe 'onddo_proftpd'

directory '/etc/proftpd/authorized_keys/' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file "/etc/proftpd/conf.d/sftp.conf" do
  source "sftp.conf"
  mode "0644"
end
link '/etc/proftpd/ftpd.passwd' do
  to node['nfs_client']['nfs_mount_point'] + "/config/proftpd/ftpd.passwd"
end

# add later if needed.
# cookbook_file "/etc/proftpd/authorized_keys/ap" do
#   source "ap-key"
#   mode "0644"
# end



service 'proftpd' do
  if node['platform'] == 'ubuntu' &&
     Gem::Version.new(node['platform_version']) >= Gem::Version.new('15.04')
    provider Chef::Provider::Service::Debian
  end
  supports restart: true, reload: true, status: true
  action [:enable, :start]
end