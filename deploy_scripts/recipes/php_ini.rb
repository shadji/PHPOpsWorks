include_recipe 'php'

node['php']['directives'] = { 'date.timezone' => 'America/Los_Angeles' }