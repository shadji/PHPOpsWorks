
include_recipe "perlbrew"

perlbrew node['perlbrew']['perlbrew_root']

perlbrew '/opt/perlbrew' do
    perls         [ 'perl-5.8.8' ]
    upgrade       true
  end

perlbrew_switch 'perl-5.8.8'

perlbrew_cpanm 'Modern Perl modules' do
    modules ['DBI', 'Text::CSV', 'JSON', 'Canary::Stability',
            'JSON::XS', 'LWP', 'Module::Build', 'Mail::IMAPClient',
            'XML::LibXML', 'Authen::SASL', 'Net::FTP', 'Net::FTPSSL',
            'Web::Scraper', 'Mail::POP3Client', 'MIME::Parser',
            'DateTime', 'DateTime::Format::MySQL', 'Math::GMP',
            'Net::SSH::Perl', 'Math::Pari', 'Net::SFTP']
    perlbrew 'perl-5.8.8@mylib'
 end

perlbrew_profile '/etc/profile.d/perlbrew.sh' do
    mode          0644
    group         'root'
    owner         'root'
    template      'perlbrew.sh.erb'
  end
