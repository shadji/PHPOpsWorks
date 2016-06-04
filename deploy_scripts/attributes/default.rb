default["php"]["packages"] = %w(php-pear)
default['proftpd']['conf']['default_address'] = node["opsworks"]["instance"]["ip"]
default['proftpd']['conf']['masquerade_address'] = node["opsworks"]["instance"]["ip"]
