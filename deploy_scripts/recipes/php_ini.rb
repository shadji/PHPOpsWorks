include_recipe 'php'
node.default['php']['packages'] = 'php-pear'

template "#{node['php']['conf_dir']}/php.ini" do
    source node['php']['ini']['template']
    cookbook node['php']['ini']['cookbook']
    unless platform?('windows')
        owner 'root'
        group 'root'
        mode '0644'
    end
    variables(:directives => { 'date.timezone' => 'America/Los_Angeles'})
end

# install a needed pear libs
php_pear "Mail" do
  action :install
end

# install a needed pear libs
php_pear "Spreadsheet_Excel_Writer" do
  action :install
end
