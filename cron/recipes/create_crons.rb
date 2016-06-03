template "/home/ec2-user/bash_wrapper.sh" do
  owner 'ec2-user'
  group 'root'
  mode 0774
  source 'bash_wrapper.erb'  
end
my_env_vars = {"TZ" => "America/New_York"}

cron 'test.pl' do
        user'ec2-user'
        environment my_env_vars
        minute '*'
        hour '*'
        day '*'
        month '*'
        weekday '*'
        command "/home/ec2-user/bash_wrapper.sh test.pl"
        action :create
end
