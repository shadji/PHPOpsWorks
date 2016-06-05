
$AWS_ACCESS_KEY_ID = ''
$AWS_SECRET_ACCESS_KEY = ''
ruby_block "Get file from s3" do
    block do
		
		$AWS_ACCESS_KEY_ID =  node[:deploy]['scripts'][:environment_variables][:AWS_ACCESS_KEY_ID]
		$AWS_SECRET_ACCESS_KEY =  node[:deploy]['scripts'][:environment_variables][:AWS_SECRET_ACCESS_KEY]
	
	end
end

ruby_block "Get file from s3" do
    block do
		
		Chef::Log.info("'#{ $AWS_ACCESS_KEY_ID}")
		Chef::Log.info("'#{ $AWS_SECRET_ACCESS_KEY}'")
	
	end
end




include_recipe 's3_file'


s3_file "/srv/www/t2" do
bucket "mybucket.deyan"
  remote_path "t2"
  aws_access_key_id $AWS_ACCESS_KEY_ID
  aws_secret_access_key $AWS_SECRET_ACCESS_KEY
end