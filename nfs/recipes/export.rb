
nfs_export "/exports" do
  network '*'
  writeable true 
  sync true
  options ['no_root_squash']
end