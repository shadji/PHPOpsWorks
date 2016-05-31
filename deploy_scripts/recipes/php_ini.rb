# include_recipe 'php::ini'

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