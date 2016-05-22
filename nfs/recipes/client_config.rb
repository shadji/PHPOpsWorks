
directory node[:deploy]['PHP'][:environment_variables][:NFS_MOUNT] do
  mode 0777
  owner 'root'
  group 'root'
  recursive true
  action :create
end

mount node[:deploy]['PHP'][:environment_variables][:NFS_MOUNT] do
  device node[:deploy]['PHP'][:environment_variables][:NFS_SERVER]
  action [:mount, :enable]
end