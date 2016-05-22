
directory node['nfs']['export'] do
  mode 0755
  owner 'root'
  group 'root'
  recursive true
  action :create
end

nfs_export node['nfs']['export'] do
  network '*'
  writeable true 
  sync true
  options ['no_root_squash']
end