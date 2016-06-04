group 'apache' do  
  gid 48
end

user 'apache' do
  comment 'Apache'
  uid '48'
  gid '48'
  home '/var/www'
  shell '/sbin/nologin'
end

group 'nfs-share' do  
  members ['ec2-user', 'apache', 'nobody']
  gid 5001
end

	
