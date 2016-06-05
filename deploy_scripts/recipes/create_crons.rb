include_recipe 'cron'

template "/home/ec2-user/bash_wrapper.sh" do
  owner 'ec2-user'
  group 'ec2-user'
  mode 0774
  source 'bash_wrapper.erb'
end

template "/etc/sysconfig/crond" do
  owner 'root'
  group 'root'
  mode 0600
  source 'crond.erb'
end

my_env_vars = {"TZ" => "America/New_York"}
node[:crons].each do |cron|

  cron cron[:name] do
    hour cron[:hour]
    minute cron[:minute]
    weekday cron[:weekday]
    day cron[:day]
    month cron[:month]
    mailto cron[:mailto]
    environment my_env_vars
    command %W{/home/ec2-user/bash_wrapper.sh "#{cron[:script]}"
      }.join(' ')
    action :delete if cron[:disable]
  end
end
# cron 'test.pl' do
#         user'ec2-user'
#         environment my_env_vars
#         minute '*'
#         hour '*'
#         day '*'
#         month '*'
#         weekday '*'
#         command "/home/ec2-user/bash_wrapper.sh test.pl"
#         action :create
# end
