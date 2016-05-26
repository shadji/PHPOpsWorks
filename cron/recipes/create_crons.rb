cron 'test.pl' do
        user'ec2-user'
        minute '*'
        hour '*'
        day '*'
        month '*'
        weekday '*'
        environment env
        command "/opt/perlbrew/perls/perl-5.8.8/bin/perl /tmp/test.pl >> /home/ec2-user/test.pl.log"
        action :create
end
