node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  notify { "Node ${::fqdn} is up and running!": }
}

node 'node' {
  class { '::mysql::server':
    root_password => 'password',
  }

  mysql_database { 'test_mdb':
    ensure  =>  present,
    charset =>  'utf8',
  }

  mysql_user { 'test_user@localhost':
    ensure  =>  present,
    password_hash =>  mysql_password('password'),
  }

  mysql_grant { 'test_user@localhost/test_mdb.*':
    ensure  =>  present,
    options =>  ['GRANT'],
    privileges  =>  ['ALL'],
    table =>  'test_mdb.*',
    user  =>  'test_user@localhost',
  }
}
