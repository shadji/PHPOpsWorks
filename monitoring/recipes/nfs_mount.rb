template "/home/ec2-user/nfs_mounts_check.sh" do
  owner 'ec2-user'
  group 'root'
  mode 0774
  source 'nfs_mounts_check.erb'  
end
Chef::Log.info("/home/ec2-user/nfs_mounts_check.sh creted")

template "/etc/monit.d/nfs_mounts_check" do
  owner 'root'
  group 'root'
  mode 0644
  source 'monit_mount.erb'
  notifies :restart, "service[monit]" 
end

Chef::Log.info("/etc/monit.d/nfs_mounts_check.monitrc creted")
service 'monit' do
  action :start
end