template "/etc/monit.conf" do
  owner 'root'
  group 'root'
  mode 0600
  source 'monit.erb'  
  notifies :restart, "service[monit]" 
end

service 'monit' do
  action :start
end