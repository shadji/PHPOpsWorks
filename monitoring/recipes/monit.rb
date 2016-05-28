template "/etc/monit.conf" do
  owner 'root'
  group 'root'
  mode 0600
  source 'monit.erb'
  variables(
	  :send_alert => node[:alerts][:send_alert],
	  :smtp => "#{node[:alerts][:smtp]}",
	  :port => "#{node[:alerts][:port]}",
	  :username => "#{node[:alerts][:username]}",
	  :password => "#{node[:alerts][:password]}",
	  :useTLS => node[:alerts][:useTLS],
	  :emails => node[:alerts][:emails]
	)
  notifies :restart, "service[monit]" 
end

service 'monit' do
  action :start
end