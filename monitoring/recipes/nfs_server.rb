template "/etc/monit.d/nfs_server.monitrc" do
  owner 'root'
  group 'root'
  mode 0644
  source 'monit_nfs.erb'
  notifies :restart, "service[monit]" 
end

service 'monit' do
  action :start
end