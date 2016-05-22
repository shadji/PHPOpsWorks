
directory node['nfs_client']['nfs_mount_point'] do
  mode 0777
  owner 'root'
  group 'root'
  recursive true
  action :create
end

mount node['nfs_client']['nfs_mount_point'] do
  device node['nfs_client']['nfs_server'] + ":" + node['nfs']['export']
  fstype 'nfs'
  options 'rw'
  action [:mount, :enable]
end