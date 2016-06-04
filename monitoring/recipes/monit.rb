Chef::Log.info("Updating monit ...")
Chef::Log.info(`sudo yum install -y https://kojipkgs.fedoraproject.org//packages/monit/5.14/1.el6/x86_64/monit-5.14-1.el6.x86_64.rpm`)

template "/etc/monit.conf" do
  owner 'root'
  group 'root'
  mode 0600
  source 'monit.erb'
  notifies :restart, "service[monit]"
end