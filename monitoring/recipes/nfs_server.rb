template "/etc/monit.d/" do
  owner 'root'
  group 'root'
  mode 0644
  source 'monit_nfs.erb'
  notifies :restart, "service[monit]" 
end

service 'monit' do
  action :nothing
end