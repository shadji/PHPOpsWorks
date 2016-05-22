
directory '/mnt/nfs' do
  mode 0777
  owner 'root'
  group 'root'
  recursive true
  action :create
end

mount '/mnt/nfs' do
  device 'nfs1:/srv/nfs/export'
  fstype 'nfs'
  options 'rw'
  action [:mount, :enable]
end