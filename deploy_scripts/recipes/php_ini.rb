include_recipe 'php'

['php_recipe'] = 'php::default'
node.default['php']['date.timezone'] = 'America/Los_Angeles'