cron 'test.pl' do
        user'ec2-user'
        minute '*'
        hour '*'
        day '*'
        month '*'
        weekday '*'
        command "/opt/perlbrew/perls/perl-5.8.8/bin/perl /srv/www/perlcsripts/current/test.pl >> /srv/www/perlcsripts/current/log/test.pl.log"
        action :create
end
