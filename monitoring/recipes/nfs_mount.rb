template "/home/ec2-user/nfs_mounts_check.sh" do
  owner 'ec2-user'
  group 'root'
  mode 0774
  source 'nfs_mounts_check.erb'  
end

template "/etc/monit.d/nfs_mount.monitrc" do
  owner 'root'
  group 'root'
  mode 0644
  source 'monit_mount.erb'
  notifies :restart, "service[monit]" 
end

service 'monit' do
  action :start
end