group 'apache' do  
  members ['ec2-user', 'nobody']
  gid 48
end

user 'apache' do
  comment 'Apache'
  uid 48
  gid 48
  home '/var/www'
  shell '/sbin/nologin'
end
