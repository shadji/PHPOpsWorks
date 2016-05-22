
directory deploy.[:environment_variables][:NFS_MOUNT] do
  mode 0777
  owner 'root'
  group 'root'
  recursive true
  action :create
end

mount deploy.[:environment_variables][:NFS_MOUNT] do
  device deploy.[:environment_variables][:NFS_SERVER]
  action [:mount, :enable]
end