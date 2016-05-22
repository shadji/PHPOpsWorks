directory ENV['NFS_MOUNT'] do
  mode 0777
  owner 'root'
  group 'root'
  recursive true
  action :create
end

mount ENV['NFS_MOUNT'] do
  device ENV['NFS_SERVER']
  action [:mount, :enable]
end