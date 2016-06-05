

include_recipe 's3_file'

s3_file "/srv/www/t2" do
  bucket "mybucket.deyan"
  remote_path "t2"
  aws_access_key_id lazy {"#{node[:deploy]['scripts'][:environment_variables][:AWS_ACCESS_KEY_ID]}"}
  aws_secret_access_key lazy {"#{node[:deploy]['scripts'][:environment_variables][:AWS_SECRET_ACCESS_KEY]}"}
end