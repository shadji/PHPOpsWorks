include_recipe 'php'

node.default['php']['packages'] = %w(php53 php53-devel php53-cli php-pear)
node.default['php']['date.timezone'] = 'America/Los_Angeles'