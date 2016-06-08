Chef::Log.info("Amazon EC2 CLI Tools")
package "aws-apitools-ec2" do
  action :install
end
aws_access_key_id = lambda {node[:deploy]['scripts'][:environment_variables][:AWS_ACCESS_KEY_ID]}
aws_secret_access_key = lambda {{node[:deploy]['scripts'][:environment_variables][:AWS_SECRET_ACCESS_KEY]}

ruby_block 'restore' do
  block do		
		Chef::Log.info("export AWS_ACCESS_KEY_ID=#{aws_access_key_id}; export AWS_SECRET_ACCESS_KEY=#{aws_secret_access_key}; aws s3 sync s3://#{node['s3']['bucket']} #{node['nfs']['export']}")
        Chef::Log.info(`export AWS_ACCESS_KEY_ID=#{aws_access_key_id} && export AWS_SECRET_ACCESS_KEY=#{aws_secret_access_key} && aws s3 sync s3://#{node['s3']['bucket']} #{node['nfs']['export']}`)
        raise "Restore failed" unless $?.success?
	end
end

