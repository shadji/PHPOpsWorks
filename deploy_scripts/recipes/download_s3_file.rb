
ruby_block "Get file from s3" do
    block do
		
		node.set[:AWS_ACCESS_KEY_ID][:content] =  node[:deploy]['scripts'][:environment_variables][:AWS_ACCESS_KEY_ID]
		node.set[:AWS_ACCESS_KEY_ID][:content] =  node[:deploy]['scripts'][:environment_variables][:AWS_SECRET_ACCESS_KEY]
	
	end
end


include_recipe 's3_file'


Chef::Log.info("'#{ node[:AWS_ACCESS_KEY_ID][:content]}")
Chef::Log.info("'#{ node[:AWS_ACCESS_KEY_ID][:content]}'")
s3_file "/srv/www/t2" do
  bucket "mybucket.deyan"
  remote_path "t2"
  aws_access_key_id node[:AWS_ACCESS_KEY_ID][:content]
  aws_secret_access_key node[:AWS_ACCESS_KEY_ID][:content]
end